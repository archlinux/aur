# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=rustii-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Command line tool for converting images to ASCII art"
arch=("x86_64")
url="https://crates.io/crates/rustii"
_ghurl="https://github.com/ndr3www/rustii"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
)
source=(
    "${pkgname%-bin}-${pkgver}::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/ndr3www/rustii/v${pkgver}/LICENSE"
)
sha256sums=('abdc91ce9a1c50896c2c32a9bab689f84b88e429d8c96fb72c8517dfebfa860d'
            '4cf46f46911495e998338f7e5268f1cc72191241a6b5bfd77ef96f95e4df91ec')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}