# Maintainer: Metacraft Labs Ltd. <support@codetracer.com>

pkgname=codetracer
pkgver=25.09.1
pkgrel=1
pkgdesc="A user-friendly time-traveling debugger for a variety of programming languages"
url="https://codetracer.com"
arch=(x86_64)
license=("AGPL-3.0-only")
depends=("fuse" "openssl" "xdg-desktop-portal")
makedepends=()
provides=("ct")
source=("codetracer-resources-${pkgver}.tar.xz::https://github.com/metacraft-labs/$pkgname/releases/download/${pkgver}/resources.tar.xz" "https://downloads.codetracer.com/CodeTracer-${pkgver}-amd64.AppImage")
noextract=("CodeTracer-${pkgver}-amd64.AppImage")
sha256sums=('bcc5263349f11a35eb6d6c239445cfdcea858fa7becb3cc609ac05b9760371a4'
            '3720f1bfa7ebb09e0d558fd3ff0d3bf7f32ae86bf48e06c64335fa6b97659be7')
options=(!strip)

package() {
	install -Dm755 "${srcdir}"/CodeTracer-"${pkgver}"-amd64.AppImage "${pkgdir}"/usr/bin/ct
	install -Dm644 "${srcdir}"/resources/codetracer.desktop "${pkgdir}"/usr/share/applications/codetracer.desktop

	install -Dm644 "${srcdir}"/resources/Icon.iconset/icon_16x16.png "${pkgdir}"/usr/share/icons/hicolor/16x16/apps/codetracer.png
	install -Dm644 "${srcdir}"/resources/Icon.iconset/icon_32x32.png "${pkgdir}"/usr/share/icons/hicolor/32x32/apps/codetracer.png
	install -Dm644 "${srcdir}"/resources/Icon.iconset/icon_128x128.png "${pkgdir}"/usr/share/icons/hicolor/128x128/apps/codetracer.png
	install -Dm644 "${srcdir}"/resources/Icon.iconset/icon_256x256.png "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/codetracer.png
	install -Dm644 "${srcdir}"/resources/Icon.iconset/icon_512x512.png "${pkgdir}"/usr/share/icons/hicolor/512x512/apps/codetracer.png
}
