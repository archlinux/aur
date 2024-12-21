# Maintainer: taotieren <admin@taotieren.com>
# edrawproject global edition

pkgname=edrawproject-en
_pkgname=EdrawProj-3
pkgver=3.7.0
pkgrel=1
arch=('x86_64')
options=(!strip)
provides=("edrawproject")
conflicts=("edrawproject")
pkgdesc="EdrawProj - A professional Gantt chart tool to plan, manage and track you projects,process and resourecs. -- Global Edition"
license=('Commercial')
url="https://www.edrawsoft.com/edraw-project/"
source_x86_64=("${pkgname}-${pkgver}.deb::https://download.edrawsoft.com/archives/edrawproject_en_full5372.deb")
sha256sums_x86_64=('SKIP')

prepare() {
    #     ar -x *.deb
    mkdir -pv "$srcdir/$pkgname"
    tar -xf "$srcdir/data.tar.xz" --xattrs-include='*' --numeric-owner -C "$pkgname"
}
package() {
    #    export LC_CTYPE="zh_CN.UTF-8"
    cp -r ${srcdir}/${pkgname}/* ${pkgdir}

    install -dm755 "${pkgdir}/usr/bin/" \
        "${pkgdir}/usr/share/icons/"

    ln -sf "/opt/${_pkgname}/edrawproj.sh" "${pkgdir}/usr/bin/edrawproject"
    ln -sf "/opt/${_pkgname}/edrawproject.png" "${pkgdir}/usr/share/icons/edrawproject.png"

    rm -rf ${pkgdir}/usr/share/applications/.*
}
