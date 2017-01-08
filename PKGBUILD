# Maintainer: Christian Pinedo <chr.pinedo@gmail.com>

pkgname=hyphen-eu-es
pkgver=1.2
pkgrel=2
pkgdesc="Basque hyphenation rules"
arch=('any')
url="http://extensions.libreoffice.org/extensions/xuxen-5-zuzentzaile-ortografikoa"
license=('GPL')
optdepends=("hyphen: offers hyphenation library functions")
source=("$url/$pkgver/@@download/file/xuxen_openoffice_libreoffice.oxt")
sha256sums=('e3ba62d4107c780a91fd4afb5e021e4c89ebed25d387d567be353fdf9407951f')

package() {
    install -D -m644 ${srcdir}/eu_hyph.dic ${pkgdir}/usr/share/hyphen/hyph_eu_ES.dic
    mkdir -p ${pkgdir}/usr/share/myspell/dicts/
    ln -s /usr/share/hyphen/hyph_eu_ES.dic ${pkgdir}/usr/share/myspell/dicts/hyph_eu_ES.dic
    install -D -m644 ${srcdir}/eu_hyph_readme.txt ${pkgdir}/usr/share/doc/${pkgname}/readme.txt
}
