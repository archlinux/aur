# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Mario Blättermann <mariobl@gnome.org>

pkgname=wmblob
pkgver=1.0.3
pkgrel=3
pkgdesc="wmblob shows some blobs moving around"
arch=('i686' 'x86_64')
url="http://dockapps.windowmaker.org/file.php/id/155"
license=('GPL')
groups=(x11)
depends=('gtk2')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://dockapps.windowmaker.org/download.php/id/541/wmblob-1.0.3.tar.bz2")
noextract=()
md5sums=('5821d20d4e4b86f8ff996320ece2424b')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr \
              --mandir=/usr/share/man \
              --x-includes=/usr/include/X11 \
              --x-libraries=/usr/lib/X11
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
