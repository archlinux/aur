# Maintainer: Ren Tatsumoto <tatsu at autistici dot org>

pkgname=transformers_ocr
pkgver=0.10
pkgrel=1
pkgdesc="An OCR tool for manga using maim with Transformers."
arch=(any)
url="https://github.com/Ajatt-Tools/transformers_ocr"
license=("GPL3")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
depends=('python' 'python-pip' 'bash' 'libnotify')
optdepends=(
	 'maim: taking screenshots on Xorg'
	 'xclip: copying to the clipboard on Xorg'

	 'grim: taking screenshots on Wayland'
	 'slurp: selecting a region on Wayland'
	 'wl-clipboard: copying to the clipboard on Wayland'
)
sha256sums=('e39d8b306f12b32bb68d9900d7f5fe50b97083ab9e8d8debfcc199cac2303b4d')

package() {
	cd -- "${pkgname}-${pkgver}"
	make PREFIX="${pkgdir}/usr" install
}
