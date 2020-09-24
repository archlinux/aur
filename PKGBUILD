# Maintainer: Simon Brulhart <simon@brulhart.me>

pkgname=python-taxi-zebra
pkgver=2.2.3
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
sha512sums=('0ff2376172a7c4132c7f1e6da96989a0f6c690d94f377b9b6f37520c7e61887bd7e1cced32774569c0a39a7cf42b31de578c47d7cd9fde317aec18bae8e03baa'
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
