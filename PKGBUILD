# Maintainer: Darjan Krijan [https://disc-kuraudo.eu]

pkgname=disc-kuraudo-home
pkgver=0.5.0
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
sha256sums_x86_64=('21747f5da9081e1d05d2c3329644fa976d40131d9b6ef07313dd5746c03302ce')
sha256sums_aarch64=('0c8645da7abb08735e1340cb079cc7029cdd788b1dbe84873fab1caa8b21af37')

package() {
	cd "${srcdir}/${pkgname}-linux-${CARCH}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
