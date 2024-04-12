# Contributor: Lara Maia <lara@craft.net.br>
# Maintainer: Florian Dejonckheere <florian at floriandejonckheere dot be>

pkgname=geany-themes-git
_gitname=geany-themes
pkgver=1.24.74.gb4b0ba9
pkgrel=1
pkgdesc='A collection of color schemes for geany.'
arch=('any')
url="https://git.geany.org/${_gitname}"
license=('GPL')
depends=('geany')
conflicts=('geany-themes')
makedepends=('git')
provides=('geany-themes')
source=("git+https://git.geany.org/${_gitname}")
md5sums=('SKIP')

pkgver()
{
	cd "${srcdir}/${_gitname}"
	git describe --always --tags | sed 's|-|.|g'
}

package()
{
	cd "${srcdir}/${_gitname}"
	make install COLORSCHEME_DIR="${pkgdir}"/usr/share/geany/colorschemes
}
