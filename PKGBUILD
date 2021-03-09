# Maintainer: demon-rem <demonicrem@gmail.com>
pkgname=auto-sub
pkgver=0.0.1
pkgrel=1
pkgdesc="A tool to batch add subtitles, chapters, tags, attachments to media files. Uses FFmpeg in backend"
arch=('x86_64')
url="https://github.com/demon-rem/${pkgname}"
license=('MIT')
groups=()
depends=('ffmpeg')
makedepends=('git')
provides=('auto-sub')
conflicts=('auto-sub')
replaces=()
backup=()
options=()
install=
source=(
	"${pkgname}_${pkgver}.gz::${url}/releases/download/${pkgver}/${pkgname}_${pkgver}_linux_x86_64.gz" 
	"${pkgname}::git+${url}"
)
noextract=()
validpgpkeys=()

package() {
	install -Dm 777 "${pkgname}_${pkgver}" "${pkgdir}/usr/bin/${pkgname}"

	cd $pkgname
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

sha256sums=(
	'14fdd8fcb05d0b58e2630b64342157fc4d541759aa9fc3364c22763ec8b980b7'
	'SKIP'
)
