# Maintainer: StoneCold <forumi0721[at]gmail[dot]com>

pkgname=("mc2xml-bin")
pkgver=1.3
pkgrel=6
pkgdesc="mc2xml is a small and fast standalone command line program for Windows/Linux/OSX that downloads media center, titantv, or schedules direct tv listings and outputs an XMLTV formatted (xmltv.dtd) .xml file."
arch=("i686" "x86_64" "arm" "armv6h" "armv7h")
url="http://mc2xml.awardspace.info/"
license=("custom")
provides=("mc2xml")
conflicts=("mc2xml")
replaces=("mc2xml")
options=("!strip" "staticlibs")
source=("file://mc2xml")
md5sums=("3b612d906f295ea822abadeaf43727b0")
if [ "${CARCH}" = "arm" ] || [ "${CARCH}" = "armv6h" ] || [ "${CARCH}" = "armv7h" ]; then
	depends+=("qemu-user-static-deb")
	source+=("mc2xml.sh")
	md5sums+=("c0384823baebcee630d18af9a75757ef")
fi

package() {
	install -dm755 "${pkgdir}/usr/bin"
	if [ "${CARCH}" = "arm" ] || [ "${CARCH}" = "armv6h" ] || [ "${CARCH}" = "armv7h" ]; then
		install -Dm755 "${srcdir}/mc2xml" "${pkgdir}/usr/bin/mc2xml_x86"
		install -Dm755 "${srcdir}/mc2xml.sh" "${pkgdir}/usr/bin/mc2xml"
	else
		install -Dm755 "${srcdir}/mc2xml" "${pkgdir}/usr/bin/"
	fi
}
