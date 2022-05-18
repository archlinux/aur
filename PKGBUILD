# Maintainer: Ren Tatsumoto <tatsu at autistici dot org>

pkgname=transformers_ocr
pkgver=0.3
pkgrel=1
pkgdesc="An OCR tool for manga using maim with Transformers."
arch=(any)
url="https://github.com/Ajatt-Tools/transformers_ocr"
license=("GPL3")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
depends=('python' 'libnotify' 'python-pip' 'bash' 'maim' 'xclip')
sha256sums=('37c716fff6944d91cd6a0dc3eeeede5e5d47ef2b56899b93e7ff7ce8c57d46d8')

package() {
	cd -- "${pkgname}-${pkgver}"
	install -Dm644 ./*.py -t "${pkgdir}/usr/lib/${pkgname}"
	install -Dm755 ./*.sh -t "${pkgdir}/usr/lib/${pkgname}"
	install -d "${pkgdir}/usr/bin"
	ln -s "${pkgdir}/usr/lib/${pkgname}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
