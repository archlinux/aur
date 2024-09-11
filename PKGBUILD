# Maintainer:  Rubin Simons <me@rubin55.org>

pkgname=rusty-psn-bin
pkgver=0.4.7
pkgrel=1
pkgdesc="Update PS3 games"
provides=("rustypsn")
arch=('x86_64')
url="https://github.com/RainbowCookie32/rusty-psn"
license=("Apache")

source=(
    "https://github.com/RainbowCookie32/rusty-psn/releases/download/v${pkgver}/rusty-psn-cli-linux.zip"
    "https://github.com/RainbowCookie32/rusty-psn/releases/download/v${pkgver}/rusty-psn-egui-linux.zip"
    "rusty-psn.desktop"
    "playstation-store.svg"
)

sha256sums=(
    '1bb4e893d5c2a8b2d27da6ce7f181546414126a9564b4ad6421355826bfd34ff'
    '092f816e8542651de6ad6e4dd9c8d90205b7d153376936f6a581ee0d76997ea2'
    '2cb6715bb0cf3646091369385e285c92a2573f1602580f60a51d5c0ea8e638a5'
    '4c6f59e5d15a93b76fc1a90ca4f8283193a870627a958eff62cda952474d089b'
)

options=("!strip")

package() {
    install -o root -g root -m 755 -d "${pkgdir}/usr/bin"
    install -o root -g root -m 755 -d "${pkgdir}/usr/share/applications"
    install -o root -g root -m 755 -d "${pkgdir}/usr/share/pixmaps"

    unzip rusty-psn-cli-linux.zip -d "${pkgdir}/usr/bin"
    chmod 0755 "${pkgdir}/usr/bin/rusty-psn"

    install -o root -g root -m 755 "${srcdir}/rusty-psn" "${pkgdir}/usr/bin/rusty-psn-gui"
    install -o root -g root -m 644 "${srcdir}/rusty-psn.desktop" "${pkgdir}/usr/share/applications/rusty-psn.desktop"
    install -o root -g root -m 644 "${srcdir}/playstation-store.svg" "${pkgdir}/usr/share/pixmaps/playstation-store.svg"

}
