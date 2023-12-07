# Maintainer: taotieren <admin@taotieren.com>
# edrawmax 中文版

pkgname=edrawmax-cn
_pkgname=EdrawMax-13
pkgver=13.0.0
pkgrel=0
arch=('x86_64')
options=(!strip)
conflicts=("edrawmax")
pkgdesc="强大的办公绘图、工程绘图、图文编辑、彩页设计软件"
depends=(libarchive)
license=('Commercial')
url="https://www.edrawsoft.cn/edrawmax/"
# source_x86_64=("https://cc-download.edrawsoft.cn/EdrawMax_${pkgver}_cn.deb")
source_x86_64=("${pkgname}-${pkgver}.deb::https://cc-download.edrawsoft.cn/archives/edrawmax_cn_full5374.deb")
sha256sums_x86_64=('e1c7e2eff3b72db4ac712e9d3750b37b3ee255b86f1ed30c6e57f7438bdd5d06')

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
