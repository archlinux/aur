# Maintainer: zaeyee <zaeyee@163.com>
pkgname="phizclip-studio"
pkgver="1.1.2"
pkgrel=3
pkgdesc="PhizClip-Studio"
arch=("x86_64")
url="https://phiz.chat/"
license=('custom')
depends=()
source=(
	"${pkgname}-v${pkgver}-${pkgrel}.AppImage"::"http://i.ouzero.com:800/api/public/dl/bih14JOM"
	"${pkgname}.desktop"
	"${pkgname}.png")
sha256sums=('0a52427cff18306b8917b0061e4c3f804b94b91e5d5f63f9174500b454dfda91'
            '1e2d60584bec00079891b8b55d142bbfa8a6fac36da037bcb383c5b950e9ae5e'
            '53239505b912d9cb80a1f3e22ead56edb56a4a0d8b6b99536a6ab46a1ae8e9a1')
options=(!strip)

package() {
	install -Dm755 "${srcdir}/${pkgname}-v${pkgver}-${pkgrel}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/icons/${pkgname}.png"
	# install -Dm644 "${srcdir}/${pkgname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"

	mkdir -p "${pkgdir}/usr/bin"
	ln -sf "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin"
}
