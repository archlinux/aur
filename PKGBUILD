# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=one-gpt-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="聚合ChatGPT官方版、ChatGPT免费版、文心一言、Poe、chatchat等多平台,支持自定义导入平台"
arch=('x86_64')
url="https://github.com/1595901624/gpt-aggregated-edition"
license=('GPL3')
options=(!strip)
provides=()
conflits=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('hicolor-icon-theme' 'glibc' 'openssl-1.1' 'gdk-pixbuf2' 'webkit2gtk' 'cairo' \
    'gcc-libs' 'dbus' 'glib2' 'pango' 'gtk3')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('de65e9aa127abfb2f56771027ac0f8d3326e86cf7019d7ee7c2bffc805cc123d')
    
package() {
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}" --gname root --uname root
}