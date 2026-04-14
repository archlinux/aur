# Maintainer: Bin Jin <bjin@protonmail.com>

pkgname=oh-my-pi-bin
pkgver=14.1.1
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
sha256sums=('c2908066107b72c3994f919ba6c055639c25a4f89e777415a85d794e25e85a23'
            '2b6e6be12b2a6558aa0f5ebfe40fdc9cbf2a0b8cb732c3d28b47d929af5b2a48'
            'a4621388c5d5dce824a758670a9611d8b9972d3f191ac97b5f743533f39ccf7e'
            '545636e19386d3d4e0ae6d77354527499999c3ebfbca61b9fa5aa4ead7c0b308')

package() {
    install -Dm755 "${srcdir}/omp-${pkgver}" "${pkgdir}/usr/bin/omp"
    install -Dm755 "${srcdir}/pi_natives.linux-x64-baseline-${pkgver}.node" "${pkgdir}/usr/bin/pi_natives.linux-x64-baseline.node"
    install -Dm755 "${srcdir}/pi_natives.linux-x64-modern-${pkgver}.node" "${pkgdir}/usr/bin/pi_natives.linux-x64-modern.node"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
