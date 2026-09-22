# Maintainer: AkitaOnRails <fabio.akita@gmail.com>
pkgname=omarchy-games-menu-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="Steam-like QuickShell launcher grid for distrobox-managed PC ports, recomps and emulators (Rust backend, prebuilt binary)"
arch=('x86_64')
url="https://github.com/akitaonrails/omarchy-games-menu"
license=('MIT')
depends=('quickshell')
provides=('omarchy-games-menu')
conflicts=('omarchy-games-menu')
source=("omarchy-games-menu-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/omarchy-games-menu-${pkgver}-x86_64.tar.gz")
sha256sums=('1c0bf9abdf96d14725a2be8a7910c6a81c6a97c5580cfb6aa80f68f1571dceb9')

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
