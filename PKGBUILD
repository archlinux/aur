# Maintainer:  Marcin Wieczorek

pkgname=cppclean
pkgver=0.13
pkgrel=1
pkgdesc="Find problems in C++ source that slow development of large code bases."
url="https://github.com/myint/cppclean"
depends=('python')
license=('Apache')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/myint/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('785cfb77e3c1214ab986567312e28788cffe9cf09096743c7579ea849090a151')

build() {
  cd $srcdir/$pkgname-$pkgver
  python3 setup.py build
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python3 setup.py install --root="$pkgdir" --optimize=1
}
