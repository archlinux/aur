# $Id$
# Maintainer: Mladen Pejaković <pejakm at autistici dot org>

pkgname=hunspell-sr
pkgver=20170408
_git=acb1ebbcc60216a927622dfb6ceda8f067161f27
pkgrel=1
pkgdesc="Serbian Cyrillic and Latin hunspell dictionaries"
arch=(any)
url="https://github.com/grakic/hunspell-sr"
license=('GPL' 'LGPL' 'MPL' 'CC BY-SA 3.0 Unported')
optdepends=('hunspell:	the spell checking libraries and apps')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/grakic/hunspell-sr/archive/${_git}.tar.gz")
sha256sums=('867fb47cc588a8466e5fbfdb013d9f71f842227777bc8e432269315b063dc7d8')

build() {
 /bin/true
}

package() {
  cd "${srcdir}/${pkgname}-${_git}"
  install -dm755 ${pkgdir}/usr/share/hunspell
  install -m644 sr.aff sr.dic sr-Latn.aff sr-Latn.dic ${pkgdir}/usr/share/hunspell

  # docs
  install -dm755 ${pkgdir}/usr/share/doc/${pkgname}
  install -m644 README*.txt ${pkgdir}/usr/share/doc/${pkgname}

  # licenses
  install -D -m644 README.txt ${pkgdir}/usr/share/licenses/${pkgname}/Copyright
  install -D -m644 README_sr.txt ${pkgdir}/usr/share/licenses/${pkgname}/Copyright_sr
  install -D -m644 README-sr-Latn.txt ${pkgdir}/usr/share/licenses/${pkgname}/Copyright_sr-Latn
}
