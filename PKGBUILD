# $Id$
# Maintainer: Mladen Pejaković <pejakm at autistici dot org>

pkgname=hunspell-sr
pkgver=20140313
_git=e1ff02b45c8e133a617a1c98cae146299bc0d4de
pkgrel=1
pkgdesc="Serbian Cyrillic and Latin hunspell dictionaries"
arch=(any)
url="https://github.com/grakic/hunspell-sr"
license=('GPL' 'LGPL' 'MPL' 'CC BY-SA 3.0 Unported')
optdepends=('hunspell:	the spell checking libraries and apps')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/grakic/hunspell-sr/archive/${_git}.tar.gz")
sha1sums=('aa2f25f4f1dfcbc9d50d32fe63d07062eaa7054c')

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