# Maintainer: Ren Tatsumoto <tatsu at autistici dot org>

pkgname=transformers_ocr
pkgver=0.1
pkgrel=1
pkgdesc="An OCR tool for manga using maim with Transformers."
arch=(any)
url="https://github.com/Ajatt-Tools/transformers_ocr"
license=("GPL3")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
depends=('python' 'libnotify' 'python-pip' 'bash' 'maim' 'imagemagick' 'xclip')
sha256sums=('cc2538e1891f71547063914d4a6d7185ceaeacc4f288f306e2ad96dca8992d0e')

package() {
	cd -- "${pkgname}-${pkgver}"
	install -Dm644 ./*.py -t "${pkgdir}/usr/lib/${pkgname}"
	install -Dm755 ./*.sh -t "${pkgdir}/usr/lib/${pkgname}"
	install -d "${pkgdir}/usr/bin"
	ln -s "${pkgdir}/usr/lib/${pkgname}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
