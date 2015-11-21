pkgname=cuddly-octo-tatertot-git
_pkgname=cuddly-octo-tatertot
pkgdesc='Silly python scripts'
pkgrel=1
pkgver=r5.57bf561
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
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package () {
	mkdir -p $pkgdir/usr/bin
	cp `find $srcdir/$_pkgname -mindepth 1 -maxdepth 1 | grep -v .*\.md | grep -v /.git` $pkgdir/usr/bin
}
