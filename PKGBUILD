# Maintainer: KUHTOXO oxomhuk@gmail.com
pkgname=armgs
pkgver=23.2
pkgrel=1
pkgdesc="ARM GS"
arch=('x86_64')
url="https://armgs.team/"
license=('proprietary')
options=(!strip)

_install_path="/opt/${pkgname}"
_archive_name="${pkgname}.tar.xz"

source=(
	"https://dl.armgs.team/downloads/linux/x64/latest/${_archive_name}"
	"armgs.desktop"
)
#noextract=()
sha256sums=(
	'7dc21abb6f62e300cdccc15cb08e6e88489fc1cbd1fbac62826094281fcd4c79'
	'8cb6af4a27d8a312c075474cbcb783eb4b9fa1481517be4c090b664e2ffe6753'
)

package() {
	mkdir -p "${pkgdir}/opt/${pkgname}"
	cp -a "${srcdir}/." "${pkgdir}${_install_path}/"
	rm "${pkgdir}${_install_path}/${_archive_name}"
	mkdir -p "${pkgdir}/usr/share/applications/"
	cp -L "armgs.desktop" "${pkgdir}/usr/share/applications/armgs.desktop"
	rm "${pkgdir}/opt/armgs/armgs.desktop"
}