# Maintainer: sukanka <su975853527 at gmail dot com>

pkgname=siyuan-note-bin
_pkgname=siyuan-note
pkgver=1.7.9
pkgrel=1
pkgdesc="A local-first personal knowledge management system"
arch=('x86_64')
url="https://b3log.org/siyuan/"
license=('unknown')
depends=(electron)
optdepends=('pandoc: docx export.')
provides=($_pkgname)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/siyuan-note/siyuan/releases/download/v${pkgver}/siyuan-${pkgver}-linux.tar.gz"
"$_pkgname.sh"
"$_pkgname.desktop"
)
sha512sums=('9f3086257be8af1d15883371c8a1b2d2e5b607451be15d17759e9cce59e41411ae8833834dea4f37e0d1ce42bc8e41cf31d70bbb486c86664870eb07271bc539'
            '4f8f503e770c96cd376db79e4691823b5e801bc8e8c62b8da46dc743786982c978f39b07761830578806ce8aba823491f35463d14746fcd1dc3c6466b9b2901e'
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
