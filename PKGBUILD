# Maintainer chrisl echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'
# Contributor: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=syncterm
pkgver=1.0b20150722
pkgrel=1
epoch=1
pkgdesc="A BBS terminal program, Supports ANSI music and the IBM charset when possible. Will run from a console, under X11 using XLib, or using SDL."
url="http://syncterm.bbsdev.net"
license='GPL'
depends=('ncurses' 'sdl')
options=(!buildflags)
arch=('i686' 'x86_64')
source=(http://syncterm.bbsdev.net/syncterm-src.tgz)
md5sums=('d8e35f2975f9aca66b356700f721cbd8')


build() {
	cd "$srcdir/syncterm-20150722"
	cd "src/syncterm/"
	make MANPREFIX="$pkgdir/usr/share" SRC_ROOT="$(realpath ..)" PREFIX="/usr" || true
}

package() {
	cd "$srcdir/syncterm-20150722"
	cd "src/syncterm/"
	make MANPREFIX="$pkgdir/usr/share" SRC_ROOT="$(realpath ..)" PREFIX="$pkgdir/usr" install
}

