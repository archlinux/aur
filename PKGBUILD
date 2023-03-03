# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=listera-novelreader-bin
_pkgname=listera-novelreader
pkgver=1.2.1
pkgrel=2
pkgdesc="A txt Chinese novel reader, developed based on Qt5 and Dtk5.一个 txt 中文小说阅读器，基于 Qt5 和 Dtk5 开发。"
arch=('x86_64')
url="https://www.listera.top/tag/novelreader"
_giteeurl="https://gitee.com/lidanger/listera-novelreader"
license=('GPL3')
conflicts=()
depends=(hicolor-icon-theme dtkwidget)
options=()
source=("${_pkgname}-${pkgver}.deb::${_giteeurl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}-3_amd64.deb"
)
sha512sums=('d24fbb41217cbaeba1d966146784d934937393413f380e11efe816f638400b09912fafdebafd87497acd0380941068538d88c894a1511607bbbed7fbe995e892')
package() {
    bsdtar -xf data.tar.gz -C "${pkgdir}"
    mkdir -p "${pkgdir}/opt/${_pkgname}"
    mv "${pkgdir}/usr/bin/${_pkgname}" "${pkgdir}/opt/${_pkgname}"
    rm -rf "${pkgdir}/usr/bin"
    sed 's/\/usr\/bin/\/opt\/listera-novelreader/g;s/Categories=Viewer;Text;Reader;Novel;/Categories=Utility;/g' \
        -i "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
