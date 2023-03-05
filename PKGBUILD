# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=geekeditor-bin
_pkgname=geekeditor
_originname=GeekEditor
pkgver=1.4.9
pkgrel=2
pkgdesc="Immersive efficiency writing editor.极客编辑器是一款所见即所得(WYSIWYG)富文本沉浸式写作排版编辑器,它注重高效创作,可多开文档编辑,同时支持Markdown语法输入及一键排版"
arch=('x86_64')
url="https://github.com/geekeditor/geekeditor-releases"
license=('GPL3')
conflicts=()
depends=('alsa-lib' 'nodejs-lts-fermium' 'gtk3' 'at-spi2-core' 'nss')
options=()
source=("${_pkgname}_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha512sums=('feb9e1602d0cb5035fae8df9824d3a881aadbb5fae35c9009bd06e2de97a51ec7f4a3bbe4f303ab7bc9d5f2af83aec6da381f4839d36cf3d7fe77d4436f6363d')
package() {
    bsdtar -xvf data.tar.xz -C "${pkgdir}"
    rm -r "${pkgdir}/opt/GeekEditor/resources/app/node_modules/ajv/scripts/info" \
          "${pkgdir}/opt/GeekEditor/resources/app/node_modules/he/man/he.1"
}
