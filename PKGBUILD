# Contributor: Lara Maia <lara@craft.net.br>
# Maintainer: Florian Dejonckheere <florian@floriandejonckheere.be>

pkgname=geany-themes-git
_gitname=geany-themes
pkgver=1.22.26
pkgrel=2
pkgdesc="A collection of color schemes for geany."
arch=('any')
url="https://github.com/codebrainz/${_gitname}"
license=('GPL')
depends=('geany')
makedepends=('git')
provides=('geany-themes')
source=("git://github.com/codebrainz/${_gitname}.git")
md5sums=('SKIP')

pkgver(){
  cd "${srcdir}/${_gitname}"
  git describe --always | sed 's|-|.|g'
}
	
package(){
	cd "${srcdir}/${_gitname}"
	make install COLORSCHEME_DIR="${pkgdir}"/usr/share/geany/colorschemes
}
