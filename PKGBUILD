# Maintainer: glatavento <glatavento  at outlook dot com>
# Maintainer: sukanka    <su975853527 at gmail   dot com>

pkgname=siyuan-note-bin
_pkgname=siyuan-note
pkgver=1.9.6
pkgrel=2
pkgdesc="A local-first personal knowledge management system"
arch=('x86_64')
url="https://b3log.org/siyuan/"
license=('unknown')
depends=(electron17)
optdepends=('pandoc: docx export.')
provides=($_pkgname)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/siyuan-note/siyuan/releases/download/v${pkgver}/siyuan-${pkgver}-linux.tar.gz"
"$_pkgname.sh"
"$_pkgname.desktop"
)
sha512sums=('a1c31a22ba0546f32dab12b383ba5cb5211c72e9d75663639c81275dd99a445fe9e9e17c4d853775f1eb427db92a20eed74c0503fbbdd2b75ae281abfa4f8c22'
            'd55fb05334d74fbe7c98ff58270a2e0b315cdeb61c5ce93eebaf24e06f2e59986718e510b03fe1fd7c33b2dac54f972631f7ba250a1c3d76985b7f4e54a0f07e'
            '4ca7d777c2dce64d89a874af268773009ba0ebe064c3ce0034913c447666bf6636a3c81d1145579fe1b0b6a35195b1f97b1b4cd56b50e990fb0642c4aae281f0')

prepare(){
    cd $srcdir/siyuan-${pkgver}-linux
}

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
