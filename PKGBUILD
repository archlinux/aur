# Maintainer: Sam Whited <sam@samwhited.com>
# Contributor: Donald Webster <fryfrog@gmail.com>
# Contributor: Dmitry Nosachev <quartz64@gmail.com>

pkgname=ipmicfg
pkgver=1.31.1
_pkghash=200623
pkgrel=1
pkgdesc="Supermicro IPMI configuration tool"
makedepends=('unzip')
depends=("glibc")
arch=('x86_64')
license=('custom:"Super Micro Computer"')
url="http://www.supermicro.com/products/nfo/ipmi.cfm"
source=("https://www.supermicro.com/wftp/utility/IPMICFG/IPMICFG_${pkgver}_build.${_pkghash}.zip")
sha256sums=('0f435741e12a9542bd3d2622e25ce2dbe65b2475d2b4a84e00290db8e6d80995')

package() {
	install -d -m 755 "${pkgdir}/usr/lib/ipmicfg"
	install -d -m 755 "${pkgdir}/usr/bin"

	cp -dpr --no-preserve=ownership "${srcdir}/IPMICFG_${pkgver}_build.${_pkghash}/Linux/64bit/"* ${pkgdir}/usr/lib/ipmicfg
	chmod a+rx ${pkgdir}/usr/lib/ipmicfg/IPMICFG-Linux.${CARCH}
	ln -s /usr/lib/ipmicfg/IPMICFG-Linux.${CARCH} ${pkgdir}/usr/bin/ipmicfg
}


