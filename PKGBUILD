# Maintainer: Jigsaw <j1g5aw@foxmail.com>
#
pkgname=ttf-huayingmincho
pkgver=1.004
pkgdesc="Huaying Mincho 華英明朝 华英明朝"
pkgrel=2
arch=(any)
url='https://github.com/GuiWonder/HuayingMincho'
license=(custom:IPA)
depends=()
makedepends=('p7zip')
source=(
    "HuayingMincho.7z::${url}/releases/download/${pkgver}/HuayingMincho.7z"
)
sha256sums=(
    'aea489b85a8a66d323beb907aca859132f4f0b177a1be80421a4b653d0ef864a'
)
prepare() {
    7z e -y '-x!crackme' "-o ${pkgname}-${pkgver}" "HuayingMincho.7z"
}
package() {
    install -Dm444 "${srcdir}/"*.ttc -t "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${srcdir}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
