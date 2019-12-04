# Maintainer: Christian Pinedo <chr.pinedo@gmail.com>

pkgname=hyphen-eu-es
pkgver=5.1
pkgrel=1
pkgdesc="Basque hyphenation rules"
arch=('any')
url="http://xuxen.eus"
license=('GPL')
optdepends=("hyphen: offers hyphenation library functions")
source=("$url/static/installer/xuxen_${pkgver}_libreoffice.oxt")
sha256sums=('b7cee2616885c0ccebfa7e2342ab23e4311e0a998b8d8fc3f23c771b3903c0da')

package() {
    install -D -m644 ${srcdir}/eu_hyph.dic ${pkgdir}/usr/share/hyphen/hyph_eu_ES.dic
    mkdir -p ${pkgdir}/usr/share/myspell/dicts/
    ln -s /usr/share/hyphen/hyph_eu_ES.dic ${pkgdir}/usr/share/myspell/dicts/hyph_eu_ES.dic
    install -D -m644 ${srcdir}/eu_hyph_readme.txt ${pkgdir}/usr/share/doc/${pkgname}/readme.txt
}
