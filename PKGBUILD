pkgname=php54-ioncube_loader
pkgver=4.7.1
pkgrel=1
pkgdesc="Loader for PHP files encoded with ionCube PHP Encoder (php54)"
arch=(i686 x86_64)
url="http://www.ioncube.com/"
license=('CUSTOM')
depends=(php54)
backup=(etc/php/conf.d/00-ioncube_loader.ini)

if [[ $CARCH == "x86_64" ]]; then
	source=(ioncube_loader-$CARCH-$pkgver.tar.bz2::http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.bz2)
	sha256sums=('d94580420a50b785681449d0d4e6ec1b49db0256c63379f2681d4c444c21009e')
else
	source=(ioncube_loader-$CARCH-$pkgver.tar.bz2::http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86.tar.bz2)
	sha256sums=('d2c5c700b8c1ac846776ce217e64fb4d5735ffa6987960c77c0d9e9f7be5bc6d')
fi

package() {
	install -d -m0755 "$pkgdir/etc/php/conf.d"
	install -D -m0755 "$srcdir/ioncube/ioncube_loader_lin_5.4.so" "$pkgdir/usr/lib/php/modules/ioncube_loader.so"
	echo "zend_extension = /usr/lib/php/modules/ioncube_loader.so" > "$pkgdir/etc/php/conf.d/00-ioncube_loader.ini"
}
