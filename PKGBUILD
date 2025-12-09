# Maintainer: taotieren <admin@taotieren.com>
# edrawmax 中文版

pkgname=edrawmax-cn
pkgver=15.0.6
pkgrel=1
arch=('x86_64')
options=(!strip !debug)
conflicts=("edrawmax")
pkgdesc="强大的办公绘图、工程绘图、图文编辑、彩页设计软件"
depends=(
    sh
    curl
    dbus
    e2fsprogs
    expat
    gcc-libs
    glib2
    glibc
    hicolor-icon-theme
    krb5
    zlib)
makedepends=(
    libarchive)
license=('LicenseRef-Commercial')
url="https://www.edrawsoft.cn/edrawmax/"
# source_x86_64=("https://cc-download.edrawsoft.cn/EdrawMax_${pkgver}_cn.deb")
source_x86_64=("${pkgname}-${pkgver}.deb::https://cc-download.wondershare.cc/business/prd/edrawmax_cn_full5374.deb")
sha256sums_x86_64=('a8612d04624d07a12fc88835c23a100b692a4d396ed548c31cc725b9d8b79041')

package() {
    bsdtar -xf "${srcdir}/data.tar.xz" --numeric-owner -C ${pkgdir}
    chown -R root:root ${pkgdir}
    install -dm0755 "${pkgdir}/usr/bin/"
    #     /opt/apps/edrawmax/EdrawMax
    ln -sf "/opt/apps/${pkgname%-cn}/${pkgname%-cn}.sh" "${pkgdir}/usr/bin/${pkgname%-cn}"
}
