# Maintainer: Thomas Roos (Roosted7) <mail [at] thomasroos [dot] nl>

pkgname=mricrogl
pkgver=1.0.20180623
pkgrel=2
pkgdesc="A program designed to display 3D medical imaging."
arch=('x86_64')
url="https://github.com/neurolabusc/MRIcroGL"
license=('BSD')
provides=('mricrogl' 'dcm2niix')
source=("mricrogl_linux.zip::https://github.com/neurolabusc/MRIcroGL/releases/download/v1.0.20180623/mricrogl_linux.zip"
	"mricrogl.desktop")
sha512sums=('d810b9de5a94c196e8f8638ae456083d4d02f744afe8619ebc11f29ed5b14cd7e29a758f8ed72226d461590474fd718b5531ebf159ba013a50b0ad69181d42ce'
            '3a25eeca058ee8613ec46662f0efe050d241f206bf436cff2fbf90d5eee21555ad447741df45f02e90410093caa7df74bb3a768b4703d7bfbd2fc1ed34d7df53')

package(){

	install -d "${pkgdir}/usr/share/${pkgname}"
	install -d "${pkgdir}/usr/bin"
	install -d "${pkgdir}/usr/share/applications"

	cp -r "${srcdir}/mricrogl_lx/"* "${pkgdir}/usr/share/${pkgname}"
	ln -s "/usr/share/${pkgname}/MRIcroGL" "${pkgdir}"/usr/bin/mricrogl
	ln -s "/usr/share/${pkgname}/dcm2niix" "${pkgdir}"/usr/bin/dcm2niix

	chmod 754 "${pkgdir}/usr/share/${pkgname}/lut/"*
	chmod 755 "${pkgdir}/usr/share/${pkgname}/script/"*
	chmod 754 "${pkgdir}/usr/share/${pkgname}/shaders/"*
	chmod 754 "${pkgdir}/usr/share/${pkgname}/shaders/unused"*

	install -Dm644 "${srcdir}/mricrogl.desktop" "${pkgdir}/usr/share/applications/mricrogl.desktop"
}
