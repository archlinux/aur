# Maintainer: Bin Jin <bjin@protonmail.com>

pkgname=oh-my-pi-bin
pkgver=14.0.2
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
sha256sums=('9b299a1bbbce43ffbbbf03b1d2bfe8084fd4d841f2fe6ffd558ff4cfe155ec8a'
            '137dcd0cf1fe623da1cab614d4dfb65193a95d9252c94c43e78db8e9be0432d8'
            '42950390c846f068a8bc0957012318834b81c29e699b0626afbace7a4261f307'
            '545636e19386d3d4e0ae6d77354527499999c3ebfbca61b9fa5aa4ead7c0b308')

package() {
    install -Dm755 "${srcdir}/omp-${pkgver}" "${pkgdir}/usr/bin/omp"
    install -Dm755 "${srcdir}/pi_natives.linux-x64-baseline-${pkgver}.node" "${pkgdir}/usr/bin/pi_natives.linux-x64-baseline.node"
    install -Dm755 "${srcdir}/pi_natives.linux-x64-modern-${pkgver}.node" "${pkgdir}/usr/bin/pi_natives.linux-x64-modern.node"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
