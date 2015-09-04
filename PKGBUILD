# Author : Ole Jon Bjørkum <mail at olejon dot net>
# Maintainer: Sibren Vasse <arch at sibrenvasse dot nl>

pkgname=spotcommander
pkgver=12.4
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
md5sums=('7dea4e8a0113e75ba1ebade5bd90e4c8')

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
