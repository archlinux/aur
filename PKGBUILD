# Maintainer: Ben Alex <ben.alex@acegi.com.au>

pkgname=libnx
pkgver=2.9.512
pkgrel=1
pkgdesc='Nanex NxCore tape processing library'
arch=('x86_64')
url="http://nanex.net"
license=('custom')
depends=('gcc-libs')

source=('LICENSE'
        'http://www.nanex.net/downloads/Linux/BETA/20151109.libnx.so.testing.tgz'
	'http://www.nanex.net/downloads/Linux/BETA/20141216.NxCoreAPIDU.tgz')
md5sums=('84bf6d4d8cf9e6597e8751dbe4f788f3'
         '674b616cae4bc0f1bf15690b0a119f18'
         '3bd43ad96641781079ad80e50197d876')

package() {
	cd ${srcdir}
	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	cd ${srcdir}/20141216.NxCoreAPIDU/NxCoreDU
	install -Dm644 NxCoreAPIDU.h ${pkgdir}/usr/include/NxCoreAPIDU.h
	install -Dm644 NxCoreLoadLib.h ${pkgdir}/usr/include/NxCoreLoadLib.h
	cd ${srcdir}/20151109.libnx.so.testing/CentOS-x64-63_gcc-4.7.2-O3_v2.9.512
	install -Dm644 libnx.so ${pkgdir}/usr/lib/libnx.so
}
