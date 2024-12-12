# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=corewatch-bin
_pkgname=CoreWatch
pkgver=Stable
pkgrel=1
pkgdesc="System monitoring tool for Linux completely in Terminal mode.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/powercomp750/CoreWatch-sysmonitor"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'python'
)
source=(
    "${pkgname%-bin}-${pkgver}::${url}/releases/download/${pkgver}/${_pkgname//C/c}-alpha"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/powercomp750/CoreWatch-sysmonitor/${pkgver}/LICENSE"
)
sha256sums=('cb3c98b9580fc7714dfa474f944ce83759ddf6683f7eee9a476a4d1075dd596e'
            '79c391a890760d8f3eeb6b19b14f6b662a86b32b05c2f90f8b98ee1a87428ebd')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}