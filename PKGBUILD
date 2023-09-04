# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=passwordsafe-bin
pkgver=1.17.0
pkgrel=1
pkgdesc="Popular secure and convenient password manager"
arch=("x86_64")
url="https://pwsafe.org/"
_githuburl="https://github.com/pwsafe/pwsafe"
license=("Artistic2.0")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('file' 'gcc-libs' 'curl' 'libx11' 'hicolor-icon-theme' 'libxtst' 'qrencode' 'glibc' 'util-linux-libs')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}-linuxmint21-${pkgver//.0/}-amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/pwsafe/pwsafe/${pkgver}/LICENSE")
sha256sums=('5b85f6ea5e5138db109dd6f1e5a48f394d70255317e10d747f1b1f059d594a61'
            'c423e5a75b647f900aca691a7f48ddc131f2f8c3d3daaa597093cf576c92ba79')
package() {
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}