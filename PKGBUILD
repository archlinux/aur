# Maintainer: Bin Jin <bjin@protonmail.com>

pkgname=oh-my-pi-bin
pkgver=14.2.0
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
sha256sums=('daee28b90ba179b9b3eb0db1e3132c7564a22b8b89319a4e5e4dcb60e0848ce5'
            '48f8e81f3e0c35af234d5cfcd6358e2711fb3b449b1f76cd14146a5d614e0620'
            '4e8be6bd6c4e8eee61da0577e5397bc854eac5de0e7afe612d3b8a7a15d69fae'
            '545636e19386d3d4e0ae6d77354527499999c3ebfbca61b9fa5aa4ead7c0b308')

package() {
    install -Dm755 "${srcdir}/omp-${pkgver}" "${pkgdir}/usr/bin/omp"
    install -Dm755 "${srcdir}/pi_natives.linux-x64-baseline-${pkgver}.node" "${pkgdir}/usr/bin/pi_natives.linux-x64-baseline.node"
    install -Dm755 "${srcdir}/pi_natives.linux-x64-modern-${pkgver}.node" "${pkgdir}/usr/bin/pi_natives.linux-x64-modern.node"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
