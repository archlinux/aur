# Maintainer: Deltara <boided420 at gmail dot com>
_pkgname="ocelot-desktop"
pkgname="${_pkgname}-bin"
pkgver=1.14.1
pkgrel=0
pkgdesc="OpenComputers emulator focused on accuracy"
arch=("x86_64")
url="https://ocelot.fomalhaut.me/desktop"
license=("MIT")
depends=("jre8-openjdk" "xorg-xrandr" "sh" "hicolor-icon-theme")
source=(
	"${pkgname}-${pkgver}.jar::https://gitlab.com/api/v4/projects/9941848/packages/generic/ocelot-desktop/v${pkgver}/ocelot-desktop-v${pkgver}.jar"
	"${pkgname}.svg::https://ocelot.fomalhaut.me/images/ocelot.svg"
	"${pkgname}.sh"
	"${pkgname}.desktop"
)
noextract=("${pkgname}-${pkgver}.jar")
md5sums=(
	"a77b871d381bd211e011251df7f671f4"
	"37a46aedc8266fcdae3576f64085d8cd"
	"fdd97c173e32dcb4d3045f3f0f7f59a4"
	"199a49c7ea149bfa763fb030cc469494"
)

package() {
	install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 "${pkgname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
	install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	install -Dm755 "${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${_pkgname}/${_pkgname}.jar"
}
