# Maintainer: Simon Brulhart <simon@brulhart.me>

pkgname='python-taxi-zebra'
pkgver=1.3.0
pkgrel=1
pkgdesc="Zebra backend for Taxi"
arch=('any')
license=('custom')
url="https://github.com/sephii/taxi-zebra"
depends=('python-requests' 'python-six')
makedepends=('python' 'python-setuptools')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/sephii/taxi-zebra/archive/$pkgver.tar.gz"
  "https://raw.githubusercontent.com/sephii/taxi/master/LICENSE"
)
sha512sums=('9c44e89cae3107605aa5b59faceb74a94607226b811c4ba882f555254a16d8240e058d881f23e0e941a5ff36a822d53eb8627a40ff2a60dd5accd3ce8542e431'
            '87e4e0e9f65b92db1a3f84823427b0870ae01675fa6e631a8c2e2d89eb12ee19d6011b4f4e74f6d4ca30868010206ef0ddd0b24a814c24b84bc41a5e68864dd4')

build() {
  cd "$srcdir/taxi-zebra-$pkgver"
  python setup.py build
}

package() {
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  cd "$srcdir/taxi-zebra-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
