# Maintainer:  glatavento <glatavento  at outlook dot com>
# Contributor: sukanka    <su975853527 at gmail   dot com>

pkgname=siyuan-note-bin
_pkgname=siyuan-note
pkgver=2.5.4
pkgrel=1
pkgdesc="A local-first personal knowledge management system"
arch=('x86_64')
url="https://b3log.org/siyuan/"
license=('AGPL3')
depends=(electron22-bin)
optdepends=('pandoc: docx export.')
provides=($_pkgname)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/siyuan-note/siyuan/releases/download/v${pkgver}/siyuan-${pkgver}-linux.tar.gz"
"$_pkgname.sh"
"$_pkgname.desktop")
sha512sums=('d12fbdd20e734a77a9a0dd0270787b7bcd10498603d73956a4e1bd549c309d80632b0de0314a01dbe661058f5be63bf9e802c93c1a909c8c4249a285e3f81271'
            'fd81efdce512374b2990a18b7b1c00050c2d775eaa1230bc0ffbbc78b5379800a19aa9dbfd18272bd914a8456a9a9c4b3851d56cc85ce506dbf11e61f21967d2'
            '4ca7d777c2dce64d89a874af268773009ba0ebe064c3ce0034913c447666bf6636a3c81d1145579fe1b0b6a35195b1f97b1b4cd56b50e990fb0642c4aae281f0')

package() {
    cd $srcdir 
    install -Dm755 ${_pkgname}.sh  ${pkgdir}/usr/bin/${_pkgname}
    install -Dm644 ${_pkgname}.desktop -t ${pkgdir}/usr/share/applications
    
    cd $srcdir/siyuan-${pkgver}-linux
    install -Dm644 resources/stage/icon.png  ${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png
    mkdir -p ${pkgdir}/usr/lib
    mv resources ${pkgdir}/usr/lib/${_pkgname}
}
# vim: ts=2 sw=2 et:
