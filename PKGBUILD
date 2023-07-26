# Maintainer: Jigsaw <j1g5aw@foxmail.com>
#
pkgname=ttf-huayingmincho
pkgver=1.006
pkgdesc="Huaying Mincho 華英明朝 华英明朝"
pkgrel=1
arch=(any)
url='https://github.com/GuiWonder/HuayingMincho'
license=(custom:IPA)
depends=()
makedepends=('p7zip')
source=(
    "HuayingMincho.7z::${url}/releases/download/${pkgver}/HuayingMincho.7z"
)
sha256sums=(
    '4c6fabe670ec1ac5453b2193bf0d283fa3e8d0af568d9406f8f1f0653b99845f'
)
prepare() {
    7z e -y '-x!crackme' "-o ${pkgname}-${pkgver}" "HuayingMincho.7z"
}
package() {
    install -Dm444 "${srcdir}/"*.ttc -t "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${srcdir}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
