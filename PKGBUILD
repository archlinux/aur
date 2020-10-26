# Maintainer: Christian Pinedo <chr.pinedo@gmail.com>

pkgname=hunspell-eu-es
pkgver=5.1
pkgrel=2
pkgdesc="Basque hunspell dictionary"
arch=('any')
url="http://xuxen.eus"
license=('GPL')
optdepends=("hunspell: the spell checking libraries and apps")
source=("$url/static/hunspell/xuxen_${pkgver}_hunspell.zip")
sha256sums=('12934d021558bf001c0bcaf0a1fc6f08ce6c7e8b7d48a8cb0bfe31763f0f5988')

package() {
    install -D -m644 ${srcdir}/eu_ES.dic ${pkgdir}/usr/share/hunspell/eu_ES.dic
    install -D -m644 ${srcdir}/eu_ES.aff ${pkgdir}/usr/share/hunspell/eu_ES.aff

    mkdir -p ${pkgdir}/usr/share/myspell/dicts
    ln -s /usr/share/hunspell/eu_ES.dic ${pkgdir}/usr/share/myspell/dicts/eu_ES.dic
    ln -s /usr/share/hunspell/eu_ES.aff ${pkgdir}/usr/share/myspell/dicts/eu_ES.aff
}
