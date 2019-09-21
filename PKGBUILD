# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: Dmitry Nosachev <quartz64@gmail.com>

pkgname=ipmicfg
pkgver=1.30.0
_pkghash=190710
pkgrel=1
pkgdesc="Supermicro IPMI configuration tool"
makedepends=('unzip')
depends=("glibc")
arch=('x86_64')
license=('custom:"Super Micro Computer"')
url="http://www.supermicro.com/products/nfo/ipmi.cfm"
source=("https://www.supermicro.com/wftp/utility/IPMICFG/IPMICFG_${pkgver}_build.${_pkghash}.zip")
sha256sums=('43066f6682f13586a25d6020d0d6ec5252d7b83983380a580e95ca59b010db7c')

package() {
	install -d -m 755 "${pkgdir}/usr/lib/ipmicfg"
	install -d -m 755 "${pkgdir}/usr/bin"

	cp -dpr --no-preserve=ownership "${srcdir}/IPMICFG_${pkgver}_build.${_pkghash}/Linux/64bit/"* ${pkgdir}/usr/lib/ipmicfg
	chmod a+rx ${pkgdir}/usr/lib/ipmicfg/IPMICFG-Linux.x86_64
	ln -s /usr/lib/ipmicfg/IPMICFG-Linux.x86_64 ${pkgdir}/usr/bin/ipmicfg
}


