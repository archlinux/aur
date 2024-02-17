# Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: jtts
# Contributor: Oscar Carlsson <oscar.carlsson (at) gmail.com>

pkgname=hunspell-sv
pkgver=2.42
pkgrel=2
epoch=1
pkgdesc='Swedish dictionaries for Hunspell'
arch=(any)
url='https://extensions.libreoffice.org/en/extensions/show/swedish-spelling-dictionary-den-stora-svenska-ordlistan'
license=(LGPL-3.0-only)
source=(https://extensions.libreoffice.org/assets/downloads/z/ooo-swedish-dict-"${pkgver/./-}".oxt)
sha256sums=('6f8c62461eb4c2cfe81628094c74ab6511918520047742f14e23dd440b99f45f')

package() {
  cd dictionaries
  install -Dm644 -t "${pkgdir}"/usr/share/hunspell \
    sv_SE.dic \
    sv_SE.aff \
    sv_FI.dic \
    sv_FI.aff

  install -dm755 "${pkgdir}"/usr/share/myspell/dicts
  ln -svt "$pkgdir"/usr/share/myspell/dicts \
    /usr/share/hunspell/sv_SE.dic \
    /usr/share/hunspell/sv_SE.aff \
    /usr/share/hunspell/sv_FI.dic \
    /usr/share/hunspell/sv_FI.aff
}
