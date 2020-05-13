# Maintainer: Giovanni Harting <539@idlegandalf.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=php-ioncube_loader
pkgver=10.3.9
_phpver=7.3
pkgrel=2
pkgdesc="Loader for PHP files encoded with ionCube PHP Encoder"
arch=(i686 x86_64)
url="http://www.ioncube.com/"
license=("CUSTOM")
depends=(php)
backup=(etc/php/conf.d/00-ioncube_loader.ini)

source_i686=(ioncube_loader-i686-$pkgver.tar.gz::https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86.tar.gz)
source_x86_64=(ioncube_loader-x86_64-$pkgver.tar.gz::https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz)

sha256sums_i686=('4d73b170e4cbd32a57330b2de1e5494c675cc1b960863007088f98091abc8512')
sha256sums_x86_64=('edb6ab117935c93bbf5e0562756603733fbcaffd6fec7518306295f259638bb9')

package() {
        cd "${srcdir}"/ioncube
        install -dm0755 "${pkgdir}"/etc/php/conf.d
        install -Dm0755 ioncube_loader_lin_${_phpver}.so "${pkgdir}"/usr/lib/php/modules/ioncube_loader.so
        echo "zend_extension = /usr/lib/php/modules/ioncube_loader.so" > "${pkgdir}"/etc/php/conf.d/00-ioncube_loader.ini

        install -Dm0644 LICENSE.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.txt
        install -Dm0644 README.txt "${pkgdir}"/usr/share/doc/$pkgname/README.txt
        install -Dm0644 USER-GUIDE.txt "${pkgdir}"/usr/share/doc/$pkgname/USER-GUIDE.txt
}

