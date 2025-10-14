# Maintainer: Michael Wawrzyniak <arch ismyusernameat cmstactical nexttothecomma net>
# Contributor: chrisl echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'
# Contributor: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=syncterm
options=('!debug')
pkgver=1.7
pkgrel=1
pkgdesc="A BBS terminal program, supporting ANSI music and IBM charset."
url="http://syncterm.bbsdev.net"
license=('GPL')
depends=('ncurses')
makedepends=('unzip')
optdepends=('hicolor-icon-theme: for GUI icon support'
            'sdl2: for SDL GUI support'
            'libx11: for X11 GUI support')
arch=('i686' 'x86_64')
source=("https://downloads.sourceforge.net/project/syncterm/syncterm/$pkgname-$pkgver/$pkgname-$pkgver-src.tgz")
md5sums=('f66d2c602bb7ab05e51262c710998527')

build() {
	cd "$pkgname-$pkgver/src/syncterm"
	make PREFIX="/usr" MANPREFIX="/usr/share" RELEASE=1
}

package() {
	cd "$pkgname-$pkgver/src/syncterm"
	make PREFIX="$pkgdir/usr" MANPREFIX="$pkgdir/usr/share" RELEASE=1 install
}
