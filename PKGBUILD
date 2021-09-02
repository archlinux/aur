# Maintainer: Adrià Arrufat <swiftscyhe at gmail dot com>

_pkgname=sourcecodepro
pkgname=latex-${_pkgname}-font
pkgver=2.7
pkgrel=1
pkgdesc="Adobe's Source Code Pro for TEX(-alike) systems"
arch=('any')
url="https://www.ctan.org/tex-archive/fonts/${_pkgname}"
license=('custom:OFL-1.1')
depends=('texlive-core')
conflicts=('texlive-fontsextra')
install="${pkgname}.install"
source=("http://mirrors.ctan.org/fonts/${_pkgname}.zip")
md5sums=('9f62b26e7d9295474ef5a6c5f9d5a620')

package() {
    install -d ${pkgdir}/usr/share/texmf-dist/tex/latex/${_pkgname}
    install -Dm644 -t ${pkgdir}/usr/share/texmf-dist/tex/latex/${_pkgname} ${_pkgname}/tex/*

    install -d ${pkgdir}/usr/share/texmf-dist/fonts/enc/dvips/${_pkgname}
    find ${_pkgname}/fonts -name *enc \
    -exec install -Dm644 {} -t $pkgdir/usr/share/texmf-dist/fonts/enc/dvips/${_pkgname} \;

    install -d ${pkgdir}/usr/share/texmf-dist/fonts/opentype/adobe/${_pkgname}
    find ${_pkgname}/fonts -name *otf\
    -exec install -Dm644 {} -t $pkgdir/usr/share/texmf-dist/fonts/opentype/adobe/${_pkgname} \;

    install -d ${pkgdir}/usr/share/texmf-dist/fonts/type1/adobe/${_pkgname}
    find ${_pkgname}/fonts -name *pfb \
    -exec install -Dm644 {} -t $pkgdir/usr/share/texmf-dist/fonts/type1/adobe/${_pkgname} \;

    install -d ${pkgdir}/usr/share/texmf-dist/fonts/tfm/adobe/${_pkgname}
    find ${_pkgname}/fonts -name *tfm \
    -exec install -Dm644 {} -t $pkgdir/usr/share/texmf-dist/fonts/tfm/adobe/${_pkgname} \;

    install -d ${pkgdir}/usr/share/texmf-dist/fonts/vf/adobe/${_pkgname}
    find ${_pkgname}/fonts -name *vf\
    -exec install -Dm644 {} -t $pkgdir/usr/share/texmf-dist/fonts/vf/adobe/${_pkgname} \;

    install -Dm644 $_pkgname/doc/LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
