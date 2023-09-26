# Maintainer: taotieren <admin@taotieren.com>
# edrawmax global edition

pkgname=edrawproject-en
_pkgname=EdrawProj-1
pkgver=1.3.0
pkgrel=0
arch=('x86_64')
options=(!strip)
provides=("edrawproject")
conflicts=("edrawproject")
pkgdesc="EdrawProj - A professional Gantt chart tool to plan, manage and track you projects,process and resourecs."
license=('Commercial')
url="https://www.edrawsoft.com/edraw-project/"
source_x86_64=("${pkgname}-${CARCH}-${pkgver}.deb::https://www.edrawsoft.com/archives/edrawproject-1-amd64-en.deb")
sha256sums_x86_64=('c4ac10afa91348b12d63d44485bdd5c7c7c990b96a07264556c882daca95151c')

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

}
