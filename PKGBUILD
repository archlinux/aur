# Maintainer: Boris Timofeev <mashin87@gmail.com>
pkgname=punes
pkgver=0.106
pkgrel=1
epoch=
pkgdesc="Nintendo Entertaiment System emulator"
arch=('i686' 'x86_64')
url="https://github.com/punesemu/puNES"
license=('GPL2')
groups=()
depends=('qt5-svg' 'alsa-lib' 'hicolor-icon-theme' 'desktop-file-utils' 'nvidia-cg-toolkit')
makedepends=('qt5-tools')
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
md5sums=('e85ba4a99e933abee5df72f98bbbc7a9')
noextract=()


build() {
  cd "$srcdir/puNES-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/puNES-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
