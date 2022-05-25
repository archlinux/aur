# Maintainer: Ren Tatsumoto <tatsu at autistici dot org>

pkgname=transformers_ocr
pkgver=0.4
pkgrel=1
pkgdesc="An OCR tool for manga using maim with Transformers."
arch=(any)
url="https://github.com/Ajatt-Tools/transformers_ocr"
license=("GPL3")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
depends=('python' 'libnotify' 'python-pip' 'bash' 'maim' 'xclip')
sha256sums=('a27e6c4a9b474342b93609921da3326cfcb934203a3b6d378714dc6064bd73d7')

package() {
	cd -- "${pkgname}-${pkgver}"
	install -Dm644 ./*.py -t "${pkgdir}/usr/lib/${pkgname}"
	install -Dm755 ./*.sh -t "${pkgdir}/usr/lib/${pkgname}"
	install -d "${pkgdir}/usr/bin"
	ln -sr "${pkgdir}/usr/lib/${pkgname}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
