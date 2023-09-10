# Maintainer: Alec Mev <alec@mev.earth>
# Contributor: NightSong <ramif.47@gmail.com>

pkgname=imgurbash2
pkgver=3.3
pkgrel=1
pkgdesc='A shell script that uploads/deletes images/videos to/from IMGUR'
arch=('any')
url='https://github.com/ram-on/imgurbash2'
license=('MIT')
depends=('bash' 'curl')
optdepends=(
	'wl-clipboard: To be able to copy image/video URL to clipboard in Wayland'
	'xclip: To be able to copy image/video URL to clipboard in X'
	'xsel: To be able to copy image/video URL to clipboard in X'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ram-on/imgurbash2/archive/${pkgver}.tar.gz")
sha256sums=('7cf9d09fadcf37d47092ed07c554fa55bd21401514cbd2c59d9a88dd78a83f9f')

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 -t "${pkgdir}/usr/bin/" "${pkgname}"
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" examples.md
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
