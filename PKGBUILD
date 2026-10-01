# Maintainer: AkitaOnRails <fabio.akita@gmail.com>
pkgname=omarchy-games-menu-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="Steam-like QuickShell launcher grid for distrobox-managed PC ports, recomps and emulators (Rust backend, prebuilt binary)"
arch=('x86_64')
url="https://github.com/akitaonrails/omarchy-games-menu"
license=('MIT')
depends=('quickshell')
provides=('omarchy-games-menu')
conflicts=('omarchy-games-menu')
source=("omarchy-games-menu-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/omarchy-games-menu-${pkgver}-x86_64.tar.gz")
sha256sums=('b9f8723ca2a10d001f2f97b62befa6320a7d10f2881debb58fbc4dbfbd3cf679')

package() {
    install -Dm755 "ogm" "${pkgdir}/usr/bin/ogm"
    install -Dm755 "games-menu" "${pkgdir}/usr/bin/games-menu"
    install -Dm644 "omarchy-games-menu.desktop" \
        "${pkgdir}/usr/share/applications/omarchy-games-menu.desktop"
    install -dm755 "${pkgdir}/usr/share/omarchy-games-menu"
    cp -r qml "${pkgdir}/usr/share/omarchy-games-menu/qml"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
