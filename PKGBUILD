# Maintainer: Sander Van Balen <aur at sandervanbalen dot be>
# Contributor: imec-DistriNet research group, Department of Computer Science, KU Leuven - University of Leuven, Belgium

pkgname=verifast-bin
_pkgname=verifast
pkgver=18.02
pkgrel=1
pkgdesc="research prototype of a tool for formal verification of C and Java programs"
arch=("any")
url="https://github.com/verifast/verifast"
license=('MIT')
depends=()
conflicts=()
source=("http://github.com/${_pkgname}/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux.tar.gz" "https://raw.githubusercontent.com/verifast/verifast/master/LICENSE.md")
md5sums=("79fb1f673df94776bb465fe154200129" "a53d80725c9b46c7dc7dc507b6dee172")

package() {
	install -d "${pkgdir}/usr/bin"
	install -d "${pkgdir}/usr/share/licences/${_pkgname}"
	install -d "${pkgdir}/opt"

	install -m644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licences/${_pkgname}/LICENSE"

	destdir="${pkgdir}/opt/${_pkgname}"
	cp -r "${srcdir}/${_pkgname}-${pkgver}" "${destdir}"

	ln -s "${destdir}/bin/verifast" "${pkgdir}/usr/bin/verifast"
	ln -s "${destdir}/bin/vfide" "${pkgdir}/usr/bin/vfide"
	ln -s "${destdir}/bin/vfide" "${pkgdir}/usr/bin/verifast-ide"
}
