# Maintainer: Ren Tatsumoto <tatsu at autistici dot org>

pkgname=transformers_ocr
pkgver=0.2
pkgrel=1
pkgdesc="An OCR tool for manga using maim with Transformers."
arch=(any)
url="https://github.com/Ajatt-Tools/transformers_ocr"
license=("GPL3")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
depends=('python' 'libnotify' 'python-pip' 'bash' 'maim' 'xclip')
sha256sums=('608918b1a747ed6b7350f656811855ac5ff72265f4936cc85dc102e84380831e')

package() {
	cd -- "${pkgname}-${pkgver}"
	install -Dm644 ./*.py -t "${pkgdir}/usr/lib/${pkgname}"
	install -Dm755 ./*.sh -t "${pkgdir}/usr/lib/${pkgname}"
	install -d "${pkgdir}/usr/bin"
	ln -s "${pkgdir}/usr/lib/${pkgname}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
