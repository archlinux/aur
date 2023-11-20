# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=passwordsafe-bin
pkgver=1.18.0
pkgrel=2
pkgdesc="Popular secure and convenient password manager"
arch=("x86_64")
url="https://pwsafe.org/"
_ghurl="https://github.com/pwsafe/pwsafe"
license=("custom:Artistic2.0")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'file'
    'curl'
    'libx11'
    'hicolor-icon-theme'
    'libxtst'
    'qrencode'
    'util-linux-libs'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-linuxmint21-${pkgver//.0/}-amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/pwsafe/pwsafe/${pkgver}/LICENSE"
)
sha256sums=('787e1eb425363ecc7b95a65f2f1255bc1205dc6116cc29ffd2f0c9736db00c81'
            'c423e5a75b647f900aca691a7f48ddc131f2f8c3d3daaa597093cf576c92ba79')
package() {
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}