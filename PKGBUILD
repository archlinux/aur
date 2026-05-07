# Maintainer: Andy Bao <contact@andybao.me>
pkgname=horizon-terminal-bin
pkgver=0.2.6
pkgrel=1
pkgdesc="GPU-accelerated terminal board that puts all your sessions on an infinite canvas"
arch=('x86_64')
url="https://github.com/peters/horizon"
license=('MIT')
options=(!strip)
provides=('horizon-terminal')
conflicts=('horizon-terminal')
source=(
    "horizon-linux-x64.tar.gz::https://github.com/peters/horizon/releases/download/v${pkgver}/horizon-linux-x64.tar.gz"
    "horizon.desktop::https://github.com/peters/horizon/raw/refs/tags/v${pkgver}/packaging/linux/horizon.desktop"
    "horizon-64.png::https://github.com/peters/horizon/raw/refs/tags/v${pkgver}/assets/icons/icon-64.png"
    "horizon-128.png::https://github.com/peters/horizon/raw/refs/tags/v${pkgver}/assets/icons/icon-128.png"
    "horizon-256.png::https://github.com/peters/horizon/raw/refs/tags/v${pkgver}/assets/icons/icon-256.png"
    "horizon-512.png::https://github.com/peters/horizon/raw/refs/tags/v${pkgver}/assets/icons/icon-512.png"
    "horizon.svg::https://github.com/peters/horizon/raw/refs/tags/v${pkgver}/assets/icons/logo.svg"
)
sha256sums=(
    '5002f78e4e1ef7583487fc5735d13e462e31a432f9f087a3948f0b641216a39b'
    'cd243e063b827ac762feab1e234df11f6a691b0e416adc21ba51be7345e4e1d0'
    '44a0975cc255d3c3e53dbaa550ff5d17e4ae55838e1229355063f92e2692a6bf'
    'ca979d75edf8da828d9b1a1d27d847ef7eea6e13dfd51289a094ef29d26d8ba8'
    '7096d5d3db3caa18cbc904dc5b36bce33c2ac2421852f7ed30ae48e096ec3946'
    '4f4e67c14c0e922e4d6414d8585245e1b995711d7c2d07b3e938867cdb5526c6'
    '3a1c63d497cc2ac70e9654e6cf9aa564cb8dd6d0a2670e35c25792ac0cf23c80'
)

package() {
    install -Dm755 horizon "${pkgdir}/usr/bin/horizon"

    for size in 64 128 256 512; do
        install -Dm644 "horizon-${size}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/horizon.png"
    done

    install -Dm644 horizon.svg \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/horizon.svg"

    install -Dm644 horizon.desktop \
        "${pkgdir}/usr/share/applications/horizon.desktop"
}
