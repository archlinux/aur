# Maintainer: Ren Tatsumoto <tatsu at autistici dot org>

pkgname=transformers_ocr
pkgver=0.15
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
sha256sums=('e59abe2fba28aaeccbff0fde36a757cda3d447430f91077beaf10ed528b86a55')

package() {
	cd -- "${pkgname}-${pkgver}"
	make PREFIX="${pkgdir}/usr" install
}
