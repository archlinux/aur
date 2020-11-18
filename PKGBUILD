# Maintainer: Thomas Roos (Roosted7) <mail [at] thomasroos [dot] nl>

pkgname=mricrogl
pkgver=1.2.20201102
pkgrel=1
pkgdesc="A program designed to display 3D medical imaging."
arch=('x86_64')
url="https://github.com/rordenlab/MRIcroGL12"
license=('BSD')
provides=('mricrogl' 'dcm2niix')
source=("MRIcroGL_linux.zip::https://github.com/rordenlab/MRIcroGL12/releases/download/v${pkgver}/MRIcroGL_linux.zip"
	"mricrogl.desktop")
sha512sums=('4cf110f332a4df52a22141c1129a30482a6a55337ad7f4044d405789d74bd8a43e25d8c66a9f2cd22593191fc4870f9f1bb9d7525dd06932b9ca46a981501bfe'
            '3a25eeca058ee8613ec46662f0efe050d241f206bf436cff2fbf90d5eee21555ad447741df45f02e90410093caa7df74bb3a768b4703d7bfbd2fc1ed34d7df53')

package(){

	install -d "${pkgdir}/usr/share/${pkgname}"
	install -d "${pkgdir}/usr/bin"
	install -d "${pkgdir}/usr/share/applications"

	cp -r "${srcdir}/MRIcroGL/"* "${pkgdir}/usr/share/${pkgname}"
	ln -s "/usr/share/${pkgname}/MRIcroGL" "${pkgdir}"/usr/bin/mricrogl
	ln -s "/usr/share/${pkgname}/MRIcroGL_QT" "${pkgdir}"/usr/bin/mricrogl_qt
	ln -s "/usr/share/${pkgname}/Resources/dcm2niix" "${pkgdir}"/usr/bin/dcm2niix

	chmod -R 755 "${pkgdir}/usr/share/${pkgname}/Resources/"*

	install -Dm644 "${srcdir}/mricrogl.desktop" "${pkgdir}/usr/share/applications/mricrogl.desktop"
}
