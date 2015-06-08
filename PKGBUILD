# Maintainer chrisl echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'
# Contributor: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=syncterm
pkgver=0.9.5b20140603
pkgrel=1
epoch=1
pkgdesc="A BBS terminal program, Supports ANSI music and the IBM charset when possible. Will run from a console, under X11 using XLib, or using SDL."
url="http://syncterm.bbsdev.net"
license='GPL'
depends=('ncurses' 'sdl')
options=(!buildflags)
arch=('i686' 'x86_64')
source=(http://iweb.dl.sourceforge.net/project/syncterm/syncterm/syncterm-0.9.5/syncterm-src-20140603.tgz)
md5sums=('7bf1ed92ccaff591a91e528507a5f09a')


build() {
	cd "$srcdir/syncterm-20140603"
	cd "src/syncterm/"
	make SRC_ROOT="$(realpath ..)" PREFIX="/usr" || true
}

package() {
	cd "$srcdir/syncterm-20140603"
	cd "src/syncterm/"
	make SRC_ROOT="$(realpath ..)" PREFIX="$pkgdir/usr" install
}

