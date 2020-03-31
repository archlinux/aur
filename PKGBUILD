# Maintainer: Thomas Roos (Roosted7) <mail [at] thomasroos [dot] nl>

pkgname=mricrogl
pkgver=1.2.20191219
pkgrel=1
pkgdesc="A program designed to display 3D medical imaging."
arch=('x86_64')
url="https://github.com/rordenlab/MRIcroGL12"
license=('BSD')
provides=('mricrogl' 'dcm2niix')
source=("MRIcroGL_linux.zip::https://github.com/rordenlab/MRIcroGL12/releases/download/v${pkgver}/MRIcroGL_linux.zip"
	"mricrogl.desktop")
sha512sums=('08a9b26bc21ff56f38b53562ec50f93ffcfcaebdb61e29753eff2f05daca9ab394ac8febf27dd325812fbcaf5567b4a0343a877d3d14483bd036781870667dea'
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
