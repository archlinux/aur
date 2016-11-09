# Maintainer: Kieran Colford <kieran@kcolford.com>
pkgname=hidclient
pkgver=20120728
pkgrel=1
epoch=
pkgdesc="Client program to transmit local keyboard events over bluetooth."
arch=('i686' 'x86_64')
url="http://anselm.hoffmeister.be/computer/hidclient/"
license=('GPL')
groups=()
depends=('bluez-libs')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$url/$pkgname-$pkgver.tar.bz2"
	"0001-f10-escape.patch")
md5sums=('70ca8cabf77dbe9b70ba62808942dc29'
         'c8b66710490670e33a1821b95b3b3c59')
noextract=()

prepare() {
  cd "$srcdir/"

  patch -p1 < "$srcdir/0001-f10-escape.patch"
}

build() {
  cd "$srcdir/"

  make
}

package() {
  cd "$srcdir/"

  install -Dm755 hidclient "$pkgdir/usr/bin/hidclient"
}

# vim:set ts=2 sw=2 et:
