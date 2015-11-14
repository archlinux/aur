# Maintainer: Igor Janošev <igor.janosev at outlook dot com>

pkgname=hyphen-sr
pkgver=20151113
_git=4edd9b13ed7f4484658dea5bde5aa1d920dabe4a
pkgrel=1
pkgdesc="Serbian Cyrillic and Latin hyphen dictionaries"
arch=(any)
url="https://github.com/grakic/hyphen-sr"
license=('GPL' 'LGPL' 'MPL' 'CC BY-SA 3.0 Unported')
optdepends=('hyphen:	library for high quality hyphenation and justification')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/grakic/hyphen-sr/archive/${_git}.tar.gz")
sha1sums=('4e8d3ca5065ff98ef63b0d200e469aa7e0222927')

package() {
  cd "${srcdir}/${pkgname}-${_git}"
  install -dm755 ${pkgdir}/usr/share/hyphen
  install -m644 hyph_sr.dic hyph_sr-Latn.dic ${pkgdir}/usr/share/hyphen
  
  pushd ${pkgdir}/usr/share/hyphen
  mv hyph_sr.dic hyph_sr_RS.dic
  mv hyph_sr-Latn.dic hyph_sr_Latn_RS.dic
  popd

  # docs
  install -dm755 ${pkgdir}/usr/share/doc/${pkgname}
  install -m644 README*.txt ${pkgdir}/usr/share/doc/${pkgname}

  # licenses
  install -D -m644 README.txt ${pkgdir}/usr/share/licenses/${pkgname}/Copyright
  install -D -m644 README_sr.txt ${pkgdir}/usr/share/licenses/${pkgname}/Copyright_sr
  install -D -m644 README-sr-Latn.txt ${pkgdir}/usr/share/licenses/${pkgname}/Copyright_sr-Latn
}
