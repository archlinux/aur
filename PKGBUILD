# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=passwordsafe-bin
pkgver=1.18.2
pkgrel=1
pkgdesc="Popular secure and convenient password manager"
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
    'hicolor-icon-theme'
    'util-linux-libs'
    'wxwidgets-gtk3'
    'wxwidgets-common'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-ubuntu23-${pkgver}-amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/pwsafe/pwsafe/${pkgver}/LICENSE"
)
sha256sums=('a18bb859eb14536a47f072effb3ac8860088e2a120177315abcb6ccb798b2bfe'
            '2d471d94ca72c38aeee8544cbceaa239e7cfd13fa766f8bee7a1dd8fa82c11c8')
package() {
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}