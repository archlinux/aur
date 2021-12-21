# Maintainer: haxibami <contact(at)haxibami(dot)net>
pkgname=ttf-cinecaption
pkgver=2.27
pkgrel=1
pkgdesc="A cinematic Japanese font"
arch=("any")
url="https://cute-freefont.flop.jp/sinecaption.html"
license=("custom")
source=("https://cute-freefont.flop.jp/dl/cinecaption${pkgver}.zip")
sha256sums=('0daef05b0027d3ccdec5c140fdf559f3e74d6997270d622d5e3e6242246476e8')

prepare() {
    mv *.TTF cinecaption.ttf
    iconv -f SHIFT_JIS -t UTF-8 cinecaption${pkgver}.txt > LICENSE.txt
}

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF
    install -m644 cinecaption.ttf ${pkgdir}/usr/share/fonts/TTF/

    cd ${srcdir}

    install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}
