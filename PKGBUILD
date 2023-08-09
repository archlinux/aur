# Maintainer: zhullyb <zhullyb [at] outlook dot com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=wolai-bin
pkgver=1.2.7
pkgrel=4
pkgdesc="wolai是一种新形态的文档/笔记/信息系统,它与你过去使用的所有传统文档、在线文档都有很多不同,学会使用wolai就等于拥有了一个强大的个人与团队生产力工具。"
arch=("aarch64" "armv7h" "x86_64")
url="https://www.wolai.com"
license=('freeware')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('hicolor-icon-theme' 'libcups' 'nss' 'cairo' 'libxdamage' 'libxfixes' 'pango' 'libxext' 'gtk3' 'libxcomposite' 'nspr' \
    'libdrm' 'gcc-libs' 'libxcb' 'libx11' 'expat' 'glibc' 'libxrandr' 'libxkbcommon' 'mesa' 'glib2' 'at-spi2-core' 'dbus' 'alsa-lib')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::https://cdn.wostatic.cn/dist/installers/${pkgname%-bin}_${pkgver}_arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::https://cdn.wostatic.cn/dist/installers/${pkgname%-bin}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::https://cdn.wostatic.cn/dist/installers/${pkgname%-bin}_${pkgver}_amd64.deb")
source=("LICENSE.html")
sha256sums=('04b7a1e4cecbadd2e1bc903b3ad518834f93b9b76542bf53fcb18f24faac099c')
sha256sums_aarch64=('6ecf889f2d0dbd0630617d56ee233ae71214663d1f01c16b160fda02c21506d7')
sha256sums_armv7h=('6ecf889f2d0dbd0630617d56ee233ae71214663d1f01c16b160fda02c21506d7')
sha256sums_x86_64=('c6dadbc374f9d536a8cf039d748b0e5eb74a90e3b6630abb787d5c0442e78469')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}