# Maintainer: Metacraft Labs Ltd. <support@codetracer.com>

pkgname=codetracer
pkgver=25.07.1
pkgrel=1
pkgdesc="A user-friendly time-traveling debugger for a variety of programming languages"
url="https://codetracer.com"
arch=(x86_64)
license=("AGPL-3-only")
depends=("fuse" "openssl" "xdg-desktop-portal")
makedepends=("base-devel")
provides=("ct")
source=("https://github.com/metacraft-labs/$pkgname/releases/download/${pkgver}/resources.tar.xz" "https://downloads.codetracer.com/CodeTracer-${pkgver}-amd64.AppImage")
noextract=("CodeTracer-${pkgver}-amd64.AppImage")
sha256sums=('e0e6927697da31f342878385ce07ccec890be25fb94129c31beb0fcd4d64607d'
            '3cbf401306ab816b89f322dadd3d0a9f52b7517f0494c973bc01c42903f3d18d')
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
