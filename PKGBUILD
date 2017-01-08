# Maintainer: Christian Pinedo <chr.pinedo@gmail.com>

pkgname=hunspell-eu-es
pkgver=1.2
pkgrel=2
pkgdesc="Basque hunspell dictionary"
arch=('any')
url="http://extensions.libreoffice.org/extensions/xuxen-5-zuzentzaile-ortografikoa"
license=('GPL')
optdepends=("hunspell: the spell checking libraries and apps")
source=("$url/$pkgver/@@download/file/xuxen_openoffice_libreoffice.oxt")
sha256sums=('e3ba62d4107c780a91fd4afb5e021e4c89ebed25d387d567be353fdf9407951f')

package() {
    install -D -m644 ${srcdir}/eu_ES.dic ${pkgdir}/usr/share/hunspell/eu_ES.dic
    install -D -m644 ${srcdir}/eu_ES.aff ${pkgdir}/usr/share/hunspell/eu_ES.aff

    mkdir -p ${pkgdir}/usr/share/myspell/dicts
    ln -s /usr/share/hunspell/eu_ES.dic ${pkgdir}/usr/share/myspell/dicts/eu_ES.dic
    ln -s /usr/share/hunspell/eu_ES.aff ${pkgdir}/usr/share/myspell/dicts/eu_ES.aff
}
