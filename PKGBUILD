# Maintainer: Bin Jin <bjin@protonmail.com>

pkgname=oh-my-pi-bin
pkgver=14.5.2
pkgrel=1
pkgdesc="AI Coding agent for the terminal — hash-anchored edits, optimized tool harness, LSP, Python, browser, subagents, and more (release binary)"
arch=('x86_64')
url="https://github.com/can1357/oh-my-pi"
license=('MIT')
provides=("oh-my-pi")
conflicts=("oh-my-pi")
options=('!strip')
source=("omp-${pkgver}::https://github.com/can1357/oh-my-pi/releases/download/v${pkgver}/omp-linux-x64"
        "pi_natives.linux-x64-baseline-${pkgver}.node::https://github.com/can1357/oh-my-pi/releases/download/v${pkgver}/pi_natives.linux-x64-baseline.node"
        "pi_natives.linux-x64-modern-${pkgver}.node::https://github.com/can1357/oh-my-pi/releases/download/v${pkgver}/pi_natives.linux-x64-modern.node"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/can1357/oh-my-pi/v${pkgver}/LICENSE")
sha256sums=('f345c9398b47d2074f24b0d856333091968c68c87d7b44645a0e9515e6e07155'
            '7ac16dfca1f22aae927ae4fee8b27282d7397ff2b0bfba1e8fe379df7de8c2e8'
            '6f96b638826d0a96f5124a211911c7eaaf046a91474d62fee1b9cf85be7ad2b3'
            '545636e19386d3d4e0ae6d77354527499999c3ebfbca61b9fa5aa4ead7c0b308')

package() {
    install -Dm755 "${srcdir}/omp-${pkgver}" "${pkgdir}/usr/bin/omp"
    install -Dm755 "${srcdir}/pi_natives.linux-x64-baseline-${pkgver}.node" "${pkgdir}/usr/bin/pi_natives.linux-x64-baseline.node"
    install -Dm755 "${srcdir}/pi_natives.linux-x64-modern-${pkgver}.node" "${pkgdir}/usr/bin/pi_natives.linux-x64-modern.node"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
