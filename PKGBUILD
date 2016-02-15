# Maintainer: Dmitry Nosachev <quartz64@gmail.com>
# Contributor: Dmitry Nosachev <quartz64@gmail.com>

pkgname=ipmicfg
pkgver=1.23.0_general_20151106
pkgrel=1
pkgdesc="Supermicro IPMI configuration tool"
makedepends=('unzip')
depends=("glibc")
arch=('x86_64' 'i686')
license=('custom:"Super Micro Computer"')
url="http://www.supermicro.com/products/nfo/ipmi.cfm"
source=("ftp://ftp.supermicro.com/utility/IPMICFG/${pkgname}_${pkgver}.zip")
sha256sums=('d393f6c0dbf44cdd20b7dd7905b844a5407cb35dcca77597bc90df4e518a39e5')

package() {
	cd ${srcdir}/${pkgname}_${pkgver}/linux

	mkdir -p ${pkgdir}/opt
	mkdir -p ${pkgdir}/usr/bin

	if [ "${CARCH}" = "x86_64" ]; then
		cp -rf 64bit ${pkgdir}/opt/${pkgname}
		chmod a+rx ${pkgdir}/opt/${pkgname}/ipmicfg-linux.x86_64
		ln -s /opt/${pkgname}/ipmicfg-linux.x86_64 ${pkgdir}/usr/bin/ipmicfg
	elif [ "${CARCH}" = "i686" ]; then
		cp -rf 32bit ${pkgdir}/opt/${pkgname}
		chmod a+rx ${pkgdir}/opt/${pkgname}/ipmicfg-linux.x86
		ln -s /opt/${pkgname}/ipmicfg-linux.x86 ${pkgdir}/usr/bin/ipmicfg
	fi
}


