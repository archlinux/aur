# Maintainer: Ren Tatsumoto <tatsu at autistici dot org>

pkgname=transformers_ocr
pkgver=0.17
pkgrel=1
pkgdesc="An OCR tool for manga using maim with Transformers."
arch=(any)
url="https://github.com/Ajatt-Tools/transformers_ocr"
license=("GPL3")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
depends=('python' 'python-pip' 'libnotify')
optdepends=(
	 'maim: taking screenshots on Xorg'
	 'xclip: copying to the clipboard on Xorg'

	 'grim: taking screenshots on Wayland'
	 'slurp: selecting a region on Wayland'
	 'wl-clipboard: copying to the clipboard on Wayland'

	 'gnome-screenshot: taking screenshots on GNOME'
	 'spectacle: taking screenshots on KDE'
)
sha256sums=('84edd2c832981599766b464a3350d5865b94c2593d404409c5628090d58cdead')

package() {
	cd -- "${pkgname}-${pkgver}"
	make PREFIX="${pkgdir}/usr" install
}
