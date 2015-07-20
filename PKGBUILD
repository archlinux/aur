# Maintainer: Solomon Choina <shlomochoina.com>
pkgname=vera-control-center
pkgver=1.0.17
pkgrel=2
_pkgrel=1
pkgdesc=" Control Center for vera"
arch=('x86_64' 'i686')
url="https://github.com/vera-desktop/vera-control-center"
license=('GPL2.1')
release=release-7
depends=(vera-desktop-environment)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=(https://github.com/vera-desktop/$pkgname/archive/$release/$pkgver-$_pkgrel.tar.gz)
md5sums=('3546e223d20f1570861c66c65183c91d')

prepare() {
    mv "$pkgname-$release-$pkgver-$_pkgrel" "$pkgname-$pkgver"
}

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}
