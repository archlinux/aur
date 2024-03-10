# Maintainer: Darjan Krijan [https://disc-kuraudo.eu]

pkgname=disc-kuraudo-home
pkgver=0.5.3
pkgrel=1
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
sha256sums_x86_64=('deb7cbdf98edd0013c071c27433cfa680ec1abc8db897da46c311ce95c779562')
sha256sums_aarch64=('64868ebf720f8a076b0ca869d95129344c6b7d99d7dd94adb967ebf3d0be0ef8')

package() {
	cd "${srcdir}/${pkgname}-linux-${CARCH}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
