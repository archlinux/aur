# Maintainer: Boris Timofeev <mashin87@gmail.com>
pkgname=punes
pkgver=0.100
pkgrel=1
epoch=
pkgdesc="Nintendo Entertaiment System emulator"
arch=('i686' 'x86_64')
url="http://forums.nesdev.com/viewtopic.php?t=6928"
license=('GPL2')
groups=()
depends=('sdl' 'qt5-base' 'alsa-lib' 'hicolor-icon-theme' 'desktop-file-utils' 'nvidia-cg-toolkit')
makedepends=('autoconf-archive')
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

md5sums=('f4659d85e3f5d1b53b9ee5574eedd871')

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
