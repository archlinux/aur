# Maintainer: Bin Jin <bjin@protonmail.com>

pkgname=oh-my-pi-bin
pkgver=13.19.0
pkgrel=2
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
sha256sums=('74d907099b8b64437c5f80a0ad746b7b5e426d21712d50f34845cc9a18e2a887'
            '2af798a07b88a4f51738187ceaa8d6d0248ce8b3ed6cd3bc87965fb8ec4e48d0'
            '72fc833d34226321486e153d13008aa327c0e12d8d80016df442f92b1f9bf81a'
            '545636e19386d3d4e0ae6d77354527499999c3ebfbca61b9fa5aa4ead7c0b308')

package() {
    install -Dm755 "${srcdir}/omp-${pkgver}" "${pkgdir}/usr/bin/omp"
    install -Dm755 "${srcdir}/pi_natives.linux-x64-baseline-${pkgver}.node" "${pkgdir}/usr/bin/pi_natives.linux-x64-baseline.node"
    install -Dm755 "${srcdir}/pi_natives.linux-x64-modern-${pkgver}.node" "${pkgdir}/usr/bin/pi_natives.linux-x64-modern.node"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
