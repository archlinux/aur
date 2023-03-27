# Maintainer: zhullyb <zhullyb [at] outlook dot com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=wolai
pkgname="${_pkgname}-bin"
pkgver=1.2.6
pkgrel=4
pkgdesc="wolai是一种新形态的文档/笔记/信息系统,它与你过去使用的所有传统文档、在线文档都有很多不同,学会使用wolai就等于拥有了一个强大的个人与团队生产力工具。"
arch=("x86_64")
url="https://www.wolai.com/"
license=('custom')
depends=(hicolor-icon-theme libcups nss cairo libxdamage libxfixes pango libxext gtk3 libxcomposite nspr \
    libdrm gcc-libs libxcb libx11 expat glibc libxrandr libxkbcommon mesa glib2 at-spi2-core dbus alsa-lib)
provides=("${_pkgname}")
source=("${_pkgname}-${pkgver}.deb::https://cdn.wostatic.cn/dist/installers/${_pkgname}_${pkgver}_amd64.deb"
    "LICENSE::https://www.wolai.com/pricing")
sha256sums=('9b5840ddaef1acad3e2aed8ec3bdf5dee39eed413f0b20baf769d84d68af7da3'
            'fd1194922db6f08a44cd9a0acc2e2b693da58d520ce6b105bc3827754ad8c76f')
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}