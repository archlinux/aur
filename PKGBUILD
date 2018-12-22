# Maintainer: Giovanni Harting <539@idlegandalf.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=php-ioncube_loader
pkgver=10.3.0
_phpver=7.3
pkgrel=1
pkgdesc="Loader for PHP files encoded with ionCube PHP Encoder"
arch=(i686 x86_64)
url="http://www.ioncube.com/"
license=('CUSTOM')
depends=(php)
backup=(etc/php/conf.d/00-ioncube_loader.ini)

source_i686=(ioncube_loader-i686-$pkgver.tar.gz::https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86.tar.gz)
source_x86_64=(ioncube_loader-x86_64-$pkgver.tar.gz::https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz)

sha256sums_i686=('10a78fbadef1c6dde33c0b668f5c2c94d984efeb14b330aed4b0c7a80c19a3cb')
sha256sums_x86_64=('6db2468cff898b5fbe9af4810f45c1ee6d382c563518419d47090b18e3fa7640')

package() {
        cd "$srcdir"/ioncube
        install -dm0755 "$pkgdir"/etc/php/conf.d
        install -Dm0755 ioncube_loader_lin_${_phpver}.so "$pkgdir"/usr/lib/php/modules/ioncube_loader.so
        echo "zend_extension = /usr/lib/php/modules/ioncube_loader.so" > "$pkgdir"/etc/php/conf.d/00-ioncube_loader.ini

        install -Dm0644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
        install -Dm0644 README.txt "$pkgdir"/usr/share/doc/$pkgname/README.txt
        install -Dm0644 USER-GUIDE.txt "$pkgdir"/usr/share/doc/$pkgname/USER-GUIDE.txt
}

