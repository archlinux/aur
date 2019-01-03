# Maintainer: livix <gatti.oliver@gmail.com>
pkgname=gazie
pkgver=7.15
pkgrel=1
pkgdesc="Multicompany finance application written in PHP using a MySql database backend for small to medium enterprise."
arch=('any')
url="http://gazie.devincentiis.it/"
license=('GPL')
depends=('mysql-clients' 'php')
backup=(etc/webapps/gazie/gconfig.php)
install=gazie.install
source=(https://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgname$pkgver.zip)
md5sums=('9295a3084c9329132e456c54e9e41804')

package() {
	_instdir="$pkgdir"/usr/share/webapps/gazie
	mkdir -p "$_instdir" "$pkgdir"/etc/webapps/gazie
	cd "$_instdir"
	cp -ra "$srcdir"/gazie/{*,.htaccess} .
	mv "$_instdir"/config/config/gconfig.php "$pkgdir"/etc/webapps/gazie/gconfig.php
	ln -s /etc/webapps/gazie/gconfig.php "$_instdir"/config/config/gconfig.php
}

