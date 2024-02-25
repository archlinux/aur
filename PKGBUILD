# Maintainer: Darjan Krijan [https://disc-kuraudo.eu]

pkgname=disc-kuraudo-home
pkgver=0.5.1
pkgrel=1
pkgdesc="Disc Kuraudo - The Disc Cloud"
arch=('x86_64' 'aarch64')
license=('custom')
url='https://disc-kuraudo.eu'
depends=(
	'cdrtools'
	#'cdrdao'
	#'ddrescue'
	'diffutils'
	'imagemagick'
)
optdepends=(
	'dvd+rw-tools: Retrieve information about recordable discs when dumping'
	'makemkv: Extracting movies/episodes/scenes/clips/screenshots from video discs'
	'mkvtoolnix-cli: Extracting movies/episodes/scenes/clips from video discs'
	'ffmpeg: Extracting screenshots from video discs'
)
provides=('disc-kuraudo')
conflicts=('disc-kuraudo')
source_x86_64=("https://disc-kuraudo.eu/releases/${pkgname}-linux-x86_64-${pkgver}.tar.xz")
source_aarch64=("https://disc-kuraudo.eu/releases/${pkgname}-linux-aarch64-${pkgver}.tar.xz")
sha256sums_x86_64=('bc9f0ee1f989f3873ef260783de5103b7ba67fc4955e5298184a049f47d7e0b6')
sha256sums_aarch64=('d03c0b9ff3f7c6cec397d67db30bd64b7cba519a55ac0f4c033cc8bcaa1b67b4')

package() {
	cd "${srcdir}/${pkgname}-linux-${CARCH}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
