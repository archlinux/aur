# Maintainer: Pavel Antonov <pvantonov@gmail.com>
pkgname=energetik
pkgver=0.2.1
pkgrel=1
pkgdesc="KDE service to temporarily inhibit power management"
arch=(i686 x86_64)
url="https://github.com/pvantonov/energetik"
license=('MIT')
groups=()
depends=(qt5-base kconfig kwindowsystem procps-ng)
makedepends=(cmake git)
optdepends=()
provides=(energetik)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/pvantonov/energetik/archive/0.2.1.tar.gz")
noextract=()
md5sums=(36fd4930d40e8e6aef14bf977e1d88d2)

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../energetik-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
