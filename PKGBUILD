# Maintainer:  Marcin Wieczorek

pkgname=cppclean
pkgver=0.12
pkgrel=1
pkgdesc="Find problems in C++ source that slow development of large code bases."
url="https://github.com/myint/cppclean"
depends=('python')
license=('Apache')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/myint/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('089216625569039cc0fda521b0bb4acd715419bf0662f96d7603ed9d4af9e4c4')

build() {
  cd $srcdir/$pkgname-$pkgver
  python3 setup.py build
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python3 setup.py install --root="$pkgdir" --optimize=1
}
