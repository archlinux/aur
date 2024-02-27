# Maintainer: Darjan Krijan [https://disc-kuraudo.eu]

pkgname=disc-kuraudo-home
pkgver=0.5.2
pkgrel=2
pkgdesc="Disc Kuraudo - The Disc Cloud"
arch=('x86_64' 'aarch64')
license=('custom')
url='https://disc-kuraudo.eu'
depends=(
	'cdrtools'
	#'cdrdao'
	'ddrescue'
	'diffutils'
	'dvd+rw-tools'
	'libcdio'
	'imagemagick'
)
optdepends=(
	'makemkv: Extracting movies/episodes/scenes/clips/screenshots from video discs'
	'mkvtoolnix-cli: Extracting movies/episodes/scenes/clips from video discs'
	'ffmpeg: Extracting screenshots from video discs'
)
provides=('disc-kuraudo')
conflicts=('disc-kuraudo')
source_x86_64=("https://disc-kuraudo.eu/releases/${pkgname}-linux-x86_64-${pkgver}.tar.xz")
source_aarch64=("https://disc-kuraudo.eu/releases/${pkgname}-linux-aarch64-${pkgver}.tar.xz")
sha256sums_x86_64=('85513ec2a48b15b9cb1652ce748e0b048c46c9724f37c34e12c9145c861a919d')
sha256sums_aarch64=('a2bc3728d7a56f3be5c57fb538ae222946a2d18f5507c9f76a7fcd6147a36571')

package() {
	cd "${srcdir}/${pkgname}-linux-${CARCH}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
