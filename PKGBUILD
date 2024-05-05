# Maintainer: Darjan Krijan [https://disc-kuraudo.eu]

pkgname=disc-kuraudo-home
pkgver=0.5.4
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
sha256sums_x86_64=('67e19f442d4e11d149e568f098623c8084ab9b1fdd7f49b767b658c3d51435e4')
sha256sums_aarch64=('a83778cce6b1f2b698cced7116417f70311141b99f069b900b981fc410a68813')

package() {
	cd "${srcdir}/${pkgname}-linux-${CARCH}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
