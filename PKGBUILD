# Maintainer: Bin Jin <bjin@protonmail.com>

pkgname=oh-my-pi-bin
pkgver=14.5.7
pkgrel=1
pkgdesc="AI Coding agent for the terminal — hash-anchored edits, optimized tool harness, LSP, Python, browser, subagents, and more (release binary)"
arch=('x86_64')
url="https://github.com/can1357/oh-my-pi"
license=('MIT')
provides=("oh-my-pi")
conflicts=("oh-my-pi")
options=('!strip')
source=("omp-linux-x64-${pkgver}.tar.gz::https://github.com/can1357/oh-my-pi/releases/download/v${pkgver}/omp-linux-x64.tar.gz"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/can1357/oh-my-pi/v${pkgver}/LICENSE")
sha256sums=('89a82cb1ac0b43d8e17de31daee002bd8aa68515a909c3f114e77dfe2e077031'
            '545636e19386d3d4e0ae6d77354527499999c3ebfbca61b9fa5aa4ead7c0b308')

package() {
    install -Dm755 "${srcdir}/omp" "${pkgdir}/usr/bin/omp"
    install -Dm755 "${srcdir}/pi_natives.linux-x64-baseline.node" "${pkgdir}/usr/bin/pi_natives.linux-x64-baseline.node"
    install -Dm755 "${srcdir}/pi_natives.linux-x64-modern.node" "${pkgdir}/usr/bin/pi_natives.linux-x64-modern.node"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
