# Maintainer: Dmitry Nosachev <quartz64@gmail.com>
# Contributor: Dmitry Nosachev <quartz64@gmail.com>

pkgname=ipmicfg
pkgver=1.21.0_general_20150615
pkgrel=1
pkgdesc="Supermicro IPMI configuration tool"
makedepends=('unzip')
depends=("glibc")
arch=('x86_64' 'i686')
license=('custom:"Super Micro Computer"')
url="http://www.supermicro.com/products/nfo/ipmi.cfm"
source=("ftp://ftp.supermicro.com/utility/IPMICFG/${pkgname}_${pkgver}.zip")
sha256sums=('2a8e7cf1b77c6e70d2354df41383741d8916671e003e28120e060d7940083bfa')

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


