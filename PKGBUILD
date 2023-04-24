# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=one-gpt-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="聚合ChatGPT官方版、ChatGPT免费版、文心一言、Poe、chatchat等多平台,支持自定义导入平台"
arch=('x86_64')
url="https://github.com/1595901624/gpt-aggregated-edition"
license=('GPL3')
options=(!strip)
provides=("${pkgname%-bin}")
conflits=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('hicolor-icon-theme' 'glibc' 'openssl-1.1' 'gdk-pixbuf2' 'webkit2gtk' 'cairo' \
    'gcc-libs' 'dbus' 'glib2' 'pango' 'gtk3')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('3b88f99e6ef2eac7c09f94bae812e1c003eb5ee4f664ed5ef0aa63c71e049f4a')
    
package() {
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}" --gname root --uname root
}