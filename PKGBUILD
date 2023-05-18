# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="spearmint-bin"
pkgver=0.14.0
pkgrel=1
pkgdesc="Testing, simplified. || An inclusive, accessibility-first GUI for generating clean, semantic Javascript tests in only a few clicks of a button."
arch=('x86_64')
url="https://www.spearmintjs.com/"
_githuburl="https://github.com/open-source-labs/spearmint"
license=('MIT')
providers=()
conflits=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('python' 'alsa-lib' 'libx11' 'at-spi2-core' 'libdrm' 'glibc' 'hicolor-icon-theme' 'cairo' 'libxext' 'libxdamage' 'mesa' 'gcc-libs' \
    'libxcomposite' 'nspr' 'libxrandr' 'libxfixes' 'libxkbcommon' 'bash' 'dbus' 'nodejs' 'expat' 'pango' 'gtk3' 'libxcb' 'glib2' 'libcups' 'nss')
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/open-source-labs/spearmint/main/LICENSE")
sha256sums=('b2c06f2d5ee8049c7d4c365ae89b1cdae725286865882b2686678bd66de9ae62'
            '32c14cbaf21ae0dffb9d2403e379c0eaec5691ab122b7c9c365cd50706736029')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}