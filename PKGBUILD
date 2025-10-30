# Maintainer: Metacraft Labs Ltd. <support@codetracer.com>

pkgname=codetracer
pkgver=25.10.1
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
sha256sums=('6e3f224b9419564311832290f79a57a98d724d05d7bd9201ad3870622d0d94db'
            'dd8164135f42ec9e0d029c698709b38eb23eaa5a67bc812c334397c035973e09')
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
