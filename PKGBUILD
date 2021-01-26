# Maintainer: Pavel Antonov <pvantonov@gmail.com>
pkgname=breeze-patched
pkgver=5.20.5.1
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
provides=()
conflicts=(breeze)
replaces=(breeze)
backup=()
options=()
install=
changelog=
source=("https://github.com/pvantonov/breeze/archive/v$pkgver.tar.gz")
noextract=()
md5sums=(9baa0cdce7f2de0cde0aa0e54edea8ef)

build() {
  cmake -B build -S breeze-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
