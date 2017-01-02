# Maintainer: Aner Andros <code@anerandros.info>

pkgname=freeter
pkgver=0.12.0
pkgrel=2
pkgdesc="The smartest way to work on your projects"
arch=('x86_64' 'i686')
url="https://freeter.io"
license=('custom')
depends=()
optdepends=()
provides=('freeter')
conflicts=('freeter')
options=(!strip)

source=("https://freeter.io/download/Freeter.AppImage"
    "${pkgname}.desktop"
    "${pkgname}.png")

md5sums=('d8da7249c0fec0712b34b244a1bb4bb8'
	 '9f7f7a59909105e47b735063b48b7e1c'
	 '6694f890382a9f25297f9a9a8dfb9a04')

noextract=("Freeter.AppImage")

package() {
	install -d "$pkgdir"/{opt/freeter,usr/bin}

	install -m755 Freeter.AppImage "${pkgdir}"/opt/freeter
	ln -sf /opt/freeter/Freeter.AppImage "${pkgdir}"/usr/bin/freeter

	install -D -m644 "./${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -D -m644 "./${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
