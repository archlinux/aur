# Maintainer: Pavel Antonov <pvantonov@gmail.com>
pkgname=breeze-patched
pkgver=5.20.5.3
pkgrel=1
pkgdesc="Artwork, styles and assets for the Breeze visual style for the Plasma Desktop"
arch=(i686 x86_64)
url="https://github.com/pvantonov/breeze"
license=('LGPL')
groups=()
depends=(breeze-icons frameworkintegration hicolor-icon-theme kdecoration kwayland)
makedepends=(extra-cmake-modules kcmutils)
optdepends=('breeze-gtk: Breeze widget style for GTK applications'
            'kcmutils: for breeze-settings')
groups=(plasma)
provides=(breeze)
conflicts=(breeze)
replaces=(breeze)
backup=()
options=()
install=
changelog=
source=("https://github.com/pvantonov/breeze/archive/v$pkgver.tar.gz")
noextract=()
md5sums=(8247b5bee1d583c312576ab9006aade6)

build() {
  cmake -B build -S breeze-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
