# Author : Ole Jon Bjørkum <mail at olejon dot net>
# Maintainer: Sibren Vasse <arch at sibrenvasse dot nl>

pkgname=spotcommander
pkgver=12.5
pkgrel=1
pkgdesc="A remote control for Spotify for Linux, optimized for mobile devices."
arch=('any')
url="http://www.olejon.net/code/spotcommander"
license=('GPL3')
depends=('apache' 'php' 'php-apache' 'php-sqlite' 'qt4' 'inotify-tools' 'xdotool')
optdepends=('spotify: The application to remote control')
conflicts=('spotcommander-xampp')
install=$pkgname.install
source=($url/files/$pkgname-$pkgver.tar.bz2)
md5sums=('d51fd04ae5d472242665c046b04399a6')

package()
{
	mkdir -p $pkgdir/usr/share/webapps
	mv $srcdir/$pkgname $pkgdir/usr/share/webapps/$pkgname
	cd $pkgdir/usr/share/webapps/$pkgname
	chmod 755 .
	chmod 755 bin/*
	chmod -R 777 db/
	chmod 777 run/
	chmod 666 run/*
}
