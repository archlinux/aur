# Maintainer: Simon Brulhart <simon@brulhart.me>

pkgname=python-taxi-zebra
pkgver=4.0.0
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
sha512sums=('700abdf3c748d3a7ddb70693ba8485246e647d439a8797216ee30cce38e953efa51135787e58c80ba49e4f3ba7ca04e7a27d6a4e3060f0344ad418f551472462'
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
