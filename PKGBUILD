# Maintainer: Sander Van Balen <aur at sandervanbalen dot be>
# Contributor: imec-DistriNet research group, Department of Computer Science, KU Leuven - University of Leuven, Belgium

pkgname=verifast-bin
_pkgname=verifast
pkgver=19.12
pkgrel=1
pkgdesc="research prototype of a tool for formal verification of C and Java programs"
arch=("any")
url="https://github.com/verifast/verifast"
license=('MIT')
depends=()
conflicts=()
source=("http://github.com/${_pkgname}/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux.tar.gz" "https://raw.githubusercontent.com/verifast/verifast/master/LICENSE.md")
md5sums=("235d075fa0790ad2e8401f71d9307d73" "a53d80725c9b46c7dc7dc507b6dee172")

package() {
	install -d "${pkgdir}/usr/bin"
	install -d "${pkgdir}/usr/share/licences/${_pkgname}"
	install -d "${pkgdir}/opt"

	install -m644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licences/${_pkgname}/LICENSE"

	_destdir="/opt/${_pkgname}"
	destdir="${pkgdir}${_destdir}"
	cp -r "${srcdir}/${_pkgname}-${pkgver}" "${destdir}"

	ln -s "${_destdir}/bin/verifast" "${pkgdir}/usr/bin/verifast"
	ln -s "${_destdir}/bin/vfide" "${pkgdir}/usr/bin/vfide"
	ln -s "${_destdir}/bin/vfide" "${pkgdir}/usr/bin/verifast-ide"
}
