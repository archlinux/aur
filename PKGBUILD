# Maintainer: Pedro Gabriel Drumond Pereira <pedrogabriel@dcc.ufmg.br>
# Contributor: Rafael D Martins <raziel_takato at hotmail dotcom>
# Contributor: Daniel Felipe Reis Apolinario <dapolinario at gmail dotcom>
# Contributor: Bernardo Barros <bernardobarros at gmail dotcom>
# Contributor: Robson R S Peixoto <robsonpeixoto at gmail dotcom>

pkgname=hunspell-pt-br
pkgver=3.2
pkgrel=4
pkgdesc="Brazillian Portuguese grammar, spelling and hyphenation checker to hunspell"
arch=(any)
url="http://pt-br.libreoffice.org/projetos/vero"
license=('LGPL3' 'MPL')
optdepends=('hunspell:  the spell checking libraries and apps')
source=(http://pt-br.libreoffice.org/assets/Uploads/PT-BR-Documents/VERO/VeroptBRV320AOC.oxt)
md5sums=('9a9ac174c401406604bfcf101de2a7ba')

package() {
  install -D -m644 ${srcdir}/pt_BR.dic ${pkgdir}/usr/share/hunspell/pt_BR.dic
  install -D -m644 ${srcdir}/pt_BR.aff ${pkgdir}/usr/share/hunspell/pt_BR.aff
  
  mkdir -p ${pkgdir}/usr/share/myspell/dicts
  ln -s /usr/share/hunspell/pt_BR.dic ${pkgdir}/usr/share/myspell/dicts/pt_BR.dic
  ln -s /usr/share/hunspell/pt_BR.aff ${pkgdir}/usr/share/myspell/dicts/pt_BR.aff
}
