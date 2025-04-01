# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=passwordsafe-bin
pkgver=1.21.0
pkgrel=1
pkgdesc="Popular secure and convenient password manager(Prebuilt version)"
arch=("x86_64")
url="https://pwsafe.org/"
_ghurl="https://github.com/pwsafe/pwsafe"
license=("Artistic-2.0")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'file'
    'curl'
    'qrencode'
    'util-linux-libs'
    'wxwidgets-gtk3'
    'wxwidgets-common'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-fedora41-${pkgver%.0}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/pwsafe/pwsafe/${pkgver}/LICENSE"
)
sha256sums=('4df9073aee7381530e7d24dd9068e081312a3ec92a38a3b75fd228800e32b08a'
            '2f65a5f2197c53b23dd4d2c60180286c79717393804e86494e4248c0951d9b06')
package() {
    install -Dm755 "${srcdir}/usr/bin/"* -t "${pkgdir}/usr/bin"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/share" "${pkgdir}/usr"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}