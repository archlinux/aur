# Maintainer: Jigsaw <j1g5aw@foxmail.com>
#
pkgname=ttf-huayingmincho
pkgver=1.007
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
    '92a786dd89be83397b88465eef1832012bd2f7ad4b9a60f764e948a692830266'
)
prepare() {
    7z e -y '-x!crackme' "-o ${pkgname}-${pkgver}" "HuayingMincho.7z"
}
package() {
    install -Dm444 "${srcdir}/"*.ttc -t "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${srcdir}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
