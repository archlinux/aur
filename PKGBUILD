# Maintainer: taotieren <admin@taotieren.com>
# edrawmax 中文版

pkgname=edrawmax-cn
pkgver=14.0.0
pkgrel=3
arch=('x86_64')
options=(!strip !debug)
conflicts=("edrawmax")
pkgdesc="强大的办公绘图、工程绘图、图文编辑、彩页设计软件"
depends=(
    curl
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
license=('Commercial')
url="https://www.edrawsoft.cn/edrawmax/"
# source_x86_64=("https://cc-download.edrawsoft.cn/EdrawMax_${pkgver}_cn.deb")
source_x86_64=("${pkgname}-${pkgver}.deb::https://cc-download.wondershare.cc/prd/edrawmax_full5374.deb")
sha256sums_x86_64=('4f6a3842a4c1393f442abebe22823f5e97d9f1d5198e3194f4972112cbf95692')

package() {
    bsdtar -xf "${srcdir}/data.tar.xz" --numeric-owner -C ${pkgdir}
    chown -R root:root ${pkgdir}
    install -dm0755 "${pkgdir}/usr/bin/"
    #     /opt/apps/edrawmax/EdrawMax
    ln -sf "/opt/apps/${pkgname%-cn}/${pkgname%-cn}.sh" "${pkgdir}/usr/bin/${pkgname%-cn}"
}
