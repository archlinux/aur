# Maintainer: Boris Timofeev <mashin87@gmail.com>
pkgname=punes
pkgver=0.102
pkgrel=1
epoch=
pkgdesc="Nintendo Entertaiment System emulator"
arch=('i686' 'x86_64')
url="https://github.com/punesemu/puNES"
license=('GPL2')
groups=()
depends=('sdl' 'qt5-base' 'alsa-lib' 'hicolor-icon-theme' 'desktop-file-utils' 'nvidia-cg-toolkit')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=$pkgname.install
changelog=
source=("https://github.com/punesemu/puNES/archive/v$pkgver.tar.gz")
noextract=()

md5sums=('7af307c5447f7e86d0b03cbc37f434ff')

build() {
  cd "$srcdir/puNES-$pkgver"
  ./autogen.sh
  ./configure --enable-qt5 --prefix=/usr
  make
}

package() {
  cd "$srcdir/puNES-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
