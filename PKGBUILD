# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Nicolas de la Torre <ndelatorre@gmail.com>

_pkgname=plwm
pkgname=plwm-svn
pkgver=r236
pkgrel=2
pkgdesc="The Pointless Window Manager"
arch=('any')
url="https://sourceforge.net/projects/plwm/"
license=('GPL')
depends=('python2-xlib')
makedepends=('subversion')
source=('plwm::svn+https://svn.code.sf.net/p/plwm/code/trunk')
md5sums=('SKIP')


pkgver() {
	cd "$_pkgname"
	local ver="$(svnversion)"
	printf "r%s" "${ver//[[:alpha:]]}"
}

package() {
	cd $srcdir/$_pkgname

	python2 ./setup.py install --root=$pkgdir --prefix=/usr
}
