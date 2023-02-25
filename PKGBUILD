# Maintainer: Ren Tatsumoto <tatsu at autistici dot org>

pkgname=transformers_ocr
pkgver=0.8
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
sha256sums=('e7e9717909173f0c785dd33f3a0e8a22803be1fcf7d61691ad7a29aef4958df5')

package() {
	cd -- "${pkgname}-${pkgver}"
	make PREFIX="${pkgdir}/usr" install
}
