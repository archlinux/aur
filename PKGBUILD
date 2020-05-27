# Maintainer chrisl echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'
# Contributor: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=syncterm
pkgver=1.1
pkgrel=1
epoch=1
_ver=1.1rc4
pkgdesc="A BBS terminal program, Supports ANSI music and the IBM charset when possible. Will run from a console, under X11 using XLib, or using SDL."
url="http://syncterm.bbsdev.net"
license=('GPL')
depends=('ncurses' 'sdl')
options=(!buildflags)
makedepends=(unzip)
arch=('i686' 'x86_64')
source=("https://phoenixnap.dl.sourceforge.net/project/syncterm/syncterm/syncterm-$_ver/syncterm-$_ver-src.tgz")
md5sums=('8f86d40b42869aeade1080db6ceec874')


build() {
  cd "$srcdir/syncterm-20"*
  cd "src/syncterm/"
  make MANPREFIX="$pkgdir/usr/share" SRC_ROOT="$(realpath ..)" PREFIX="/usr" || true
}

package() {
  cd "$srcdir/syncterm-20"*
  cd "src/syncterm/"
  make MANPREFIX="$pkgdir/usr/share" SRC_ROOT="$(realpath ..)" PREFIX="$pkgdir/usr" install
}

