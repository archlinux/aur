# Maintainer:  Rubin Simons <me@rubin55.org>

pkgname=rusty-psn-bin
pkgver=0.5.5
pkgrel=1
pkgdesc="A GUI/CLI tool for downloading PS3 and PS4 game updates"
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

sha256sums=('84d53db8c615057bbf2d29990dc91c41d3d2551ba76160cd00bf236b95a0ee6c'
            '0f07f97d1e755fcab3bdcb54fa27c26cb9f955846eb5358f4c42f27480d6a009'
            '2cb6715bb0cf3646091369385e285c92a2573f1602580f60a51d5c0ea8e638a5'
            '4c6f59e5d15a93b76fc1a90ca4f8283193a870627a958eff62cda952474d089b')

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
