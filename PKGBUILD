# $Id$
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=php-proctitle
pkgver=0.1.2
pkgrel=1
pkgdesc="PHP extension that allows changing the current process' name"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/proctitle"
license=('PHP')
depends=('php')
source=("http://pecl.php.net/get/proctitle-$pkgver.tgz" proctitle.ini)
backup=(etc/php/conf.d/proctitle.ini)

build() {
	cd "$srcdir/proctitle-$pkgver"
	phpize
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/proctitle-$pkgver"
	make INSTALL_ROOT="$pkgdir" install
	install -Dm0755 "$srcdir/proctitle.ini" "$pkgdir/etc/php/conf.d/proctitle.ini"
}

md5sums=('5ebf52449f50013383f052271b0dc21a'
         'e1daa35d26f0fbc2aefa33412eb24718')
