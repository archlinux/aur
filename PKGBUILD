# Maintainer: Pavel Antonov <pvantonov@gmail.com>
pkgname=energetik
pkgver=0.1.1
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
source=("https://github.com/pvantonov/energetiK/archive/0.1.1.tar.gz")
noextract=()
md5sums=(7a855c653535a8054829b5a234174879)

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
