# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="geekeditor-bin"
_appname=GeekEditor
pkgver=1.4.9
pkgrel=3
pkgdesc="Immersive efficiency writing editor.极客编辑器是一款所见即所得(WYSIWYG)富文本沉浸式写作排版编辑器,它注重高效创作,可多开文档编辑,同时支持Markdown语法输入及一键排版"
arch=('x86_64')
url="https://github.com/geekeditor/geekeditor-releases"
license=('GPL3')
conflicts=("${pkgname%-bin}")
depends=('alsa-lib' 'nodejs' 'gtk3' 'at-spi2-core' 'nss' 'libxfixes' 'libdrm' 'mesa' 'libxrandr' \
    'libxcomposite' 'nspr' 'glibc' 'libxext' 'expat' 'gdk-pixbuf2' 'libx11' 'glib2' 'libxcb' 'gcc-libs' \
    'pango' 'libxdamage' 'dbus' 'libcups' 'sh' 'hicolor-icon-theme' 'libxkbcommon' 'cairo')
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('99c69e953535adffd4edda3932d3f12acb206f104de3dddb15a04b656fda1a1a')
package() {
    bsdtar -xvf data.tar.xz -C "${pkgdir}"
    rm -r "${pkgdir}/opt/${_appname}/resources/app/node_modules/ajv/scripts/info" \
          "${pkgdir}/opt/${_appname}/resources/app/node_modules/he/man"
}
