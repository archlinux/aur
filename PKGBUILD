pkgname=cosmic-ext-applet-per-app-layout-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="COSMIC panel applet that remembers keyboard layout for each application"
arch=('x86_64')
url="https://github.com/utrumo/cosmic-ext-applet-per-app-layout"
license=('GPL-3.0-only')
depends=('libxkbcommon')
options=(!debug)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
install="${pkgname}.install"

_archive="${pkgname%-bin}-v${pkgver}-x86_64-linux.tar.gz"
source=("${url}/releases/download/v${pkgver}/${_archive}")
sha256sums=('SKIP')

package() {
    install -Dm0755 "${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm0644 "io.github.utrumo.CosmicExtAppletPerAppLayout.desktop" \
        "${pkgdir}/usr/share/applications/io.github.utrumo.CosmicExtAppletPerAppLayout.desktop"
    install -Dm0644 "io.github.utrumo.CosmicExtAppletPerAppLayout-symbolic.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.utrumo.CosmicExtAppletPerAppLayout-symbolic.svg"
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
