# Maintainer:  alessiofachechi <mail@alezz.io>
# Contributor: Shanto <shanto@hotmail.com>
# Contributor: p2k <Patrick.Schneider@uni-ulm.de>

pkgname=zend-debugger
pkgdesc="Zend Debugger extension for PHP"
pkgver=2018.10.02
pkgrel=1
_pkgrel=2018_10_02
_pkgprt=php-71-php-72
_phpver=php-7.2.x
_repo=http://downloads.zend.com/studio_debugger
arch=('x86_64')
url="http://www.zend.com/en/products/studio/downloads#Linux"
license=('custom')
depends=('php>=7.2')
makedepends=('unzip')
conflicts=('zend-debugger')
provides=('zend-debugger')
install=${pkgname}.install
source=(
	${_repo}/${_pkgrel}/ZendDebugger-deb-${arch}-${_pkgprt}.zip
	zend_debugger.ini
	${pkgname}.install
)
md5sums=(
	fc88dfa4e146f363f92a1d1c488fe67f
	ed5430a12114428be83fa3fb08e740b1
	57932796c1b412b1c3d06372f5bc9a9e
)

package() {
	cd "$srcdir"
	install -D -m 744 ${_phpver}/ZendDebugger.so "$pkgdir/usr/lib/php/modules/zend_debugger.so"
	install -D -m 644 ../zend_debugger.ini "$pkgdir/etc/php/conf.d/zend_debugger.ini"
}
