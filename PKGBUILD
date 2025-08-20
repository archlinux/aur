#Maintainer: Sam Peters <dev at libertycloud dot de>
pkgname=profex-bin
pkgver=5.5.2
pkgrel=1
pkgdesc="A program for Rietveld refinement of powder X-ray diffraction data."
arch=('x86_64')
url="https://www.profex-xrd.org/"
license=('GPL2')
groups=('science')
depends=('qt6-5compat'
	'qt6-declarative'
	'qt6-svg')
optdepends=('bgmn: the needed backend for the program, not required to build or start the program')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("https://codeberg.org/libertycloud/profex/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-${pkgrel}-${arch}.pkg.tar.zst")
sha256sums=('6aca850df7f9bff62c21e581332d476b6b998d57e1c85d31aac5ef07bb63a8bc')

package() {
	install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" \
	"${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
	
	install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" \
		"${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
	
	mkdir -p "${pkgdir}/usr/bin"
	install -Dm755 ${srcdir}/usr/bin/* "${pkgdir}/usr/bin/"

}
