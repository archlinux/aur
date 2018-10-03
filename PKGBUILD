# Maintainer: Thomas Roos (Roosted7) <mail [at] thomasroos [dot] nl>

pkgname=mricron
pkgver=20161012
pkgrel=2
pkgdesc="A program designed to display 3D medical imaging."
arch=('x86_64')
url="http://people.cas.sc.edu/rorden/mricron/index.html"
license=('custom')
provides=('mricron' 'dcm2nii' 'dcm2niigui')
source=("mricron_lx.zip::https://www.nitrc.org/frs/download.php/9322/lx.zip//?i_agree=1&download_now=1"
	"mricron.desktop"
	"dcm2nii.desktop"
	"LICENSE")
sha512sums=('33de3040942e3b76ab8ab8f212ef90c9ec4cf760187ca400dc0ca2abab035037277b65b62a4e66de7669b1d76be4b21fa668856e97b75e19ebe82377d5e04bed'
            '01496a9c5e2b3633eb762d33f6d7edb06256edbf8e19945f49795f1365229cbdd5fc301613da968ed0151b60ac3830a73823b2456e33a11052fadf134fa70a67'
            '218da3cab2955672eed51c6e212f7aba4da7992b5c67cf49c997e7da4e735a94851ef4ea55651db3295eff41500b94a2d4d42c9e3a227508d7e8788e101b4dc2'
            'ef1260dd49a06a539c237575e71e88e17b1cba6116894ad2b6549d9fb953f69fb519ba5c4b71530a976bee12b9e3b2568391cb718c9e6a0ad96bf24e6158d9fd')

package(){

	install -d "${pkgdir}/usr/share/${pkgname}"
	install -d "${pkgdir}/usr/bin"
	install -d "${pkgdir}/usr/share/applications"

	cp -r "${srcdir}/mricron_lx/"* "${pkgdir}/usr/share/${pkgname}"
	ln -s "/usr/share/${pkgname}/mricron" "${pkgdir}"/usr/bin/mricron
	ln -s "/usr/share/${pkgname}/dcm2nii" "${pkgdir}"/usr/bin/dcm2nii
	ln -s "/usr/share/${pkgname}/dcm2niigui" "${pkgdir}"/usr/bin/dcm2niigui

	chmod 754 "${pkgdir}/usr/share/${pkgname}/lut/"*
	chmod 754 "${pkgdir}/usr/share/${pkgname}/templates/"*

	install -Dm644 "${srcdir}/mricron.desktop" "${pkgdir}/usr/share/applications/mricron.desktop"
	install -Dm644 "${srcdir}/dcm2nii.desktop" "${pkgdir}/usr/share/applications/dcm2nii.desktop"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
