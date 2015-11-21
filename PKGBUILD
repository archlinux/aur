pkgname=cuddly-octo-tatertot-git
_pkgname=cuddly-octo-tatertot
pkgdesc='Silly python scripts'
pkgrel=2
pkgver=0
arch=('i686' 'x86_64')
license=('MIT')
url="https://github.com/vpzomtrrfrt/$_pkgname"
makedepends=('git' 'python2' 'zenity' 'imagemagick')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/vpzomtrrfrt/$_pkgname")
md5sums=('SKIP')

pkgver () {
	cd "$srcdir/$_pkgname"
	git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package () {
	cp `find $srcdir/$_pkgname -mindepth 1 -maxdepth 1 | grep -v *.md | grep -v /.git` $pkgdir
}
