# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Nicolas de la Torre <ndelatorre@gmail.com>

_pkgname=plwm
pkgname=plwm-svn
pkgver=r236
pkgrel=1
pkgdesc="The Pointless Window Manager"
arch=('any')
url="http://plwm.sourceforge.net/"
license=('GPL')
depends=('python2-xlib')
makedepends=('subversion')
source=('plwm::svn+https://plwm.svn.sourceforge.net/svnroot/plwm/trunk')
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
