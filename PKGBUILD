# Author: Andrew Boktor <andrew.boktor@gmail.com>

pkgname=stftp
pkgver=1.1.0
pkgrel=3
pkgdesc="A simple terminal FTP client, using ncurses. It aims to be more user friendly than other interactive terminal clients by presenting a fullscreen representation of the remote directory."
arch=('i686' 'x86_64')
url="http://stftp.sourceforge.net/"
license=('GPL2')
depends=('ncurses')
source=(http://downloads.sourceforge.net/project/stftp/stftp/stftp-1.1.0/$pkgname-$pkgver.tar.gz)
md5sums=('3a4202e7eb71f204e9982c93fca3030a')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make || return 1
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm 755 stftp "$pkgdir/usr/bin/stftp"
}
