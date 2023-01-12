# Maintainer: taotieren <admin@taotieren.com>
# edrawmax 中文版

pkgname=edrawmax-cn
_pkgname=EdrawMax-12
pkgver=12.0.6
pkgrel=0
arch=('x86_64')
options=(!strip)
conflicts=("edrawmax")
pkgdesc="强大的办公绘图、工程绘图、图文编辑、彩页设计软件"
depends=(libarchive)
license=('Commercial')
url="https://www.edrawsoft.cn/edrawmax/"
source_x86_64=("https://cc-download.edrawsoft.cn/EdrawMax_${pkgver}_cn.deb")
sha256sums_x86_64=('76bf5303f744480939275c7337d6d4da3628e9fb0389ac46cd9ba93364708e18')

prepare() {
#     ar -x *.deb
	mkdir -p ${pkgname}
    tar -xf "${srcdir}/data.tar.xz" --xattrs-include='*' --numeric-owner -C "${pkgname}"
}
package() {
    export LC_CTYPE="zh_CN.UTF-8"

    mv  ${srcdir}/${pkgname}/* ${pkgdir}

    install -dm755 "${pkgdir}/usr/bin/"

    ln -sf "/opt/${_pkgname}/EdrawMax" "${pkgdir}/usr/bin/edrawmax"

}
