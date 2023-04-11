# Maintainer: zhullyb <zhullyb [at] outlook dot com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="wolai-bin"
pkgver=1.2.7
pkgrel=1
pkgdesc="wolai是一种新形态的文档/笔记/信息系统,它与你过去使用的所有传统文档、在线文档都有很多不同,学会使用wolai就等于拥有了一个强大的个人与团队生产力工具。"
arch=("x86_64")
url="https://www.wolai.com/"
license=('custom')
depends=('hicolor-icon-theme' 'libcups' 'nss' 'cairo' 'libxdamage' 'libxfixes' 'pango' 'libxext' 'gtk3' 'libxcomposite' 'nspr' \
    'libdrm' 'gcc-libs' 'libxcb' 'libx11' 'expat' 'glibc' 'libxrandr' 'libxkbcommon' 'mesa' 'glib2' 'at-spi2-core' 'dbus' 'alsa-lib')
provides=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::https://cdn.wostatic.cn/dist/installers/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://www.wolai.com/pricing")
sha256sums=('c6dadbc374f9d536a8cf039d748b0e5eb74a90e3b6630abb787d5c0442e78469'
            'a18cf1777eb2af01b6ba1e4d72828f37e3447c502819144c14cccaecb184d0b6')
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
