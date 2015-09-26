# Maintainer: Pavel Antonov <pvantonov@gmail.com>
pkgname=energetik
pkgver=0.1.2
pkgrel=1
pkgdesc="KDE service to temporarily inhibit power management"
arch=(i686 x86_64)
url="https://github.com/pvantonov/energetiK"
license=('MIT')
groups=()
depends=(qt5-base kconfig procps-ng)
makedepends=(cmake git)
optdepends=()
provides=(energetik)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/pvantonov/energetiK/archive/0.1.2.tar.gz")
noextract=()
md5sums=(a74f408941dedcfa999590885727a28e)

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../energetiK-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
