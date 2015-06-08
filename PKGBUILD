# Maintainer: alessiofachechi <alessio.fachechi@gmail.com>
# Contributor: Shanto <shanto@hotmail.com>
# Contributor: p2k <Patrick.Schneider@uni-ulm.de>

pkgname=zend-debugger
pkgdesc="Zend Debugger extention for PHP"
pkgver=8.0.0
pkgrel=1
_pkgrel=2014_12_10
_pkgpar1=
_pkgpar2=
_phpver=php-5.6.x
_repo=http://downloads.zend.com/studio_debugger
_arch=i386
arch=('i686' 'x86_64')
url="http://www.zend.com/en/products/studio/downloads#Linux"
license=('custom')
depends=('php>=5.6')
conflicts=('zend-debugger')
provides=('zend-debugger')
install=${pkgname}.install

[ "$CARCH" == "x86_64" ] && {
	_arch=x86_64
}

source=(
	${_repo}/${_pkgrel}/ZendDebugger${_pkgpar1}-linux${_pkgpar2}-${_arch}.tar.gz
	zend_debugger.ini
	${pkgname}.install
)
md5sums=(
	947fd450785147b37333438bd18244ea
	ed5430a12114428be83fa3fb08e740b1
	68b3c506355e9f6f975c6a37dd3437f5
)

[ "$CARCH" == "x86_64" ] && {
	md5sums[0]=43e4233a7301be3b45400da8f0f3732d
}

package() {
	cd "$srcdir"
	install -D -m 744 ZendDebugger${_pkgpar1}-linux${_pkgpar2}-${_arch}/${_phpver}/ZendDebugger.so "$pkgdir/usr/lib/php/modules/zend_debugger.so"
	install -D -m 644 ../zend_debugger.ini "$pkgdir/etc/php/conf.d/zend_debugger.ini"
}
