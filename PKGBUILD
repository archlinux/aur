# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=php-ioncube_loader
pkgver=4.6.1
pkgrel=1
pkgdesc="Loader for PHP files encoded with ionCube PHP Encoder"
arch=(i686 x86_64)
url="http://www.ioncube.com/"
license=('CUSTOM')
depends=(php)
backup=(etc/php/conf.d/00-ioncube_loader.ini)

if [[ $CARCH == "x86_64" ]]; then
	source=(ioncube_loader-$CARCH-$pkgver.tar.bz2::http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.bz2)
	sha256sums=('76c01cea15c7f12204990e8458e740d68f1563eb66f6245506896cf53044761e')
else
	source=(ioncube_loader-$CARCH-$pkgver.tar.bz2::http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86.tar.bz2)
	sha256sums=('46d107b4ab68b04f171fa46a1f6ba1898532340e4578992b0c41c86a68c83071')
fi

package() {
	install -d -m0755 "$pkgdir/etc/php/conf.d"
	install -D -m0755 "$srcdir/ioncube/ioncube_loader_lin_5.5.so" "$pkgdir/usr/lib/php/modules/ioncube_loader.so"
	echo "zend_extension = /usr/lib/php/modules/ioncube_loader.so" > "$pkgdir/etc/php/conf.d/00-ioncube_loader.ini"
}
