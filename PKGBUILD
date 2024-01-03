# Maintainer: taotieren <admin@taotieren.com>
# edrawmax 中文版

pkgname=edrawproject-cn
_pkgname=EdrawProj-3
pkgver=3.3.1
pkgrel=0
arch=('x86_64')
options=(!strip)
conflicts=("edrawproject")
pkgdesc="可用于甘特图绘制、项目计划、资源分配和预算管理。软件轻巧，功能强大！"
license=('Commercial')
url="https://www.edrawsoft.cn/edrawproject/"
source_x86_64=("${pkgname}_${pkgver}.deb::https://cc-download.edrawsoft.cn/archives/edrawproject_cn_full5376.deb")
sha256sums_x86_64=('e332ac6bb3e78a35884158eeec76f29a2620eefb9972427c6a67cf26233e316a')

prepare() {
#     ar -x *.deb
    mkdir -pv "$srcdir/$pkgname"
    tar -xf "$srcdir/data.tar.xz" --xattrs-include='*' --numeric-owner -C "$pkgname"
}
package() {
#    export LC_CTYPE="zh_CN.UTF-8"
    cp -r  ${srcdir}/${pkgname}/* ${pkgdir}

    install -dm755 "${pkgdir}/usr/bin/" \
                    "${pkgdir}/usr/share/icons/"

    ln -sf "/opt/${_pkgname}/edrawproj.sh" "${pkgdir}/usr/bin/edrawproject"
    ln -sf "/opt/${_pkgname}/edrawproject.png" "${pkgdir}/usr/share/icons/edrawproject.png"
    rm -rf ${pkgdir}/usr/share/applications/.*

}
