# Maintainer: Dmitry Nosachev <quartz64@gmail.com>
# Contributor: Dmitry Nosachev <quartz64@gmail.com>

pkgname=ipmicfg
pkgver=1.22.0_general_20150814
pkgrel=1
pkgdesc="Supermicro IPMI configuration tool"
makedepends=('unzip')
depends=("glibc")
arch=('x86_64' 'i686')
license=('custom:"Super Micro Computer"')
url="http://www.supermicro.com/products/nfo/ipmi.cfm"
source=("ftp://ftp.supermicro.com/utility/IPMICFG/${pkgname}_${pkgver}.zip")
sha256sums=('953d91f22f42d88e0b6187ed7bbbc35b7b888d3eed1ae6e4924a1668e190250c')

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


