# Maintainer: Sam Whited <sam@samwhited.com>
# Contributor: Donald Webster <fryfrog@gmail.com>
# Contributor: Dmitry Nosachev <quartz64@gmail.com>

pkgname=ipmicfg
pkgver=1.32.0
_pkghash=200820
pkgrel=1
pkgdesc="Supermicro IPMI configuration tool"
makedepends=('unzip')
depends=("glibc")
arch=('x86_64')
license=('custom:"Super Micro Computer"')
url="http://www.supermicro.com/products/nfo/ipmi.cfm"
source=("https://www.supermicro.com/wftp/utility/IPMICFG/IPMICFG_${pkgver}_build.${_pkghash}.zip")
sha256sums=('b0ccd87353ca2ef4897781174b02df1e53351015743946ac3b19aed791a31547')

package() {
	install -d -m 755 "${pkgdir}/usr/lib/ipmicfg"
	install -d -m 755 "${pkgdir}/usr/bin"

	cp -dpr --no-preserve=ownership "${srcdir}/IPMICFG_${pkgver}_build.${_pkghash}/Linux/64bit/"* ${pkgdir}/usr/lib/ipmicfg
	chmod a+rx ${pkgdir}/usr/lib/ipmicfg/IPMICFG-Linux.${CARCH}
	ln -s /usr/lib/ipmicfg/IPMICFG-Linux.${CARCH} ${pkgdir}/usr/bin/ipmicfg
}


