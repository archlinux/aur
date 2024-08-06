# Maintainer: taotieren <admin@taotieren.com>
# edrawmax 中文版

pkgname=edrawmax-cn
_pkgname=EdrawMax-13
pkgver=13.5.0
pkgrel=1
arch=('x86_64')
options=(!strip)
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
source_x86_64=("${pkgname}-${pkgver}.deb::https://cc-download.edrawsoft.cn/archives/edrawmax_cn_full5374.deb")
sha256sums_x86_64=('e1c7e2eff3b72db4ac712e9d3750b37b3ee255b86f1ed30c6e57f7438bdd5d06')

package() {
    bsdtar -xf "${srcdir}/data.tar.xz" --numeric-owner -C ${pkgdir}
    chown -R root:root ${pkgdir}
    install -dm755 "${pkgdir}/usr/bin/"
    ln -sf "/opt/${_pkgname}/EdrawMax" "${pkgdir}/usr/bin/edrawmax"
}
