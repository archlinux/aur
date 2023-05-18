# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="autographa-bin"
pkgver=2.4.0
pkgrel=1
pkgdesc="linux / windows desktop diary tool. crypt with AES 256. 安全日记本，一个加密信息管理软件，加密强度非常强，只能暴力破解数据，只要密码足够复杂，数据就足够安全。"
arch=("x86_64")
url="https://github.com/friendsofagape/autographa"
license=('MIT')
depends=('libxrandr' 'expat' 'glib2' 'gcc-libs' 'libx11' 'libxcb' 'gtk3' 'hicolor-icon-theme' 'glibc' 'alsa-lib' 'pango' \
    'dbus' 'wayland' 'nspr' 'libxkbcommon' 'libxfixes' 'libdrm' 'at-spi2-core' 'mesa' 'cairo' 'libxcomposite' 'libcups' \
    'libxdamage' 'libxext' 'nss')
conflicts=("${pkgname%-bin}")
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    LICENSE::https://raw.githubusercontent.com/friendsofagape/autographa/development/LICENSE)
sha256sums=('f069d16802fa9962d76aecf180d754b72e0170c166f944e873cc09ecc3aa89b8'
            '3312af32f10019d4eeca9f021124b04711a870c77e73aea8cec0cba728e1dde8')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}