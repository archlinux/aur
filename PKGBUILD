# Maintainer: Thomas Roos (Roosted7) <mail [at] thomasroos [dot] nl>

pkgname=mricrogl
pkgver=1.2.20181114
pkgrel=1
pkgdesc="A program designed to display 3D medical imaging."
arch=('x86_64')
url="https://github.com/neurolabusc/MRIcroGL12"
license=('BSD')
provides=('mricrogl' 'dcm2niix')
source=("MRIcroGL12_linux.zip::https://github.com/rordenlab/MRIcroGL12/releases/download/1.2.20181114/MRIcroGL12_linux.zip"
	"mricrogl.desktop")
sha512sums=('3369668450ca246312b67af82664ce682e45ba3c61f82efb0bdd9f249463cffa55efbd53207887f90a1b4bf49d455e39bb735990ad39c6b067c1ab9d3d95db9c'
            '3a25eeca058ee8613ec46662f0efe050d241f206bf436cff2fbf90d5eee21555ad447741df45f02e90410093caa7df74bb3a768b4703d7bfbd2fc1ed34d7df53')

package(){

	install -d "${pkgdir}/usr/share/${pkgname}"
	install -d "${pkgdir}/usr/bin"
	install -d "${pkgdir}/usr/share/applications"

	cp -r "${srcdir}/MRIcroGL12/"* "${pkgdir}/usr/share/${pkgname}"
	ln -s "/usr/share/${pkgname}/MRIcroGL" "${pkgdir}"/usr/bin/mricrogl
	ln -s "/usr/share/${pkgname}/MRIcroGL_QT" "${pkgdir}"/usr/bin/mricrogl_qt
	ln -s "/usr/share/${pkgname}/dcm2niix" "${pkgdir}"/usr/bin/dcm2niix

	chmod 755 "${pkgdir}/usr/share/${pkgname}/Resources/"*

	install -Dm644 "${srcdir}/mricrogl.desktop" "${pkgdir}/usr/share/applications/mricrogl.desktop"
}
