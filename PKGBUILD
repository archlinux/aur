# Maintainer: Ren Tatsumoto <tatsu at autistici dot org>

pkgname=transformers_ocr
pkgver=0.18
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
sha256sums=('51cbafe7bab6e459d93f2a943a889980df465dcb65dcec5edd1e57cbf7b322a3')

package() {
	cd -- "${pkgname}-${pkgver}"
	make PREFIX="${pkgdir}/usr" install
}
