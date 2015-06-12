# Maintainer: Ariel Popper < a at arielp dot com  >

_realname="IndentFinder"

pkgname=('python2-indentfinder-hg')
pkgver=55_ec4e8baa59b5
pkgrel=1
pkgdesc='Detect the indentation scheme used in a file.'
arch=('any')
license=('BSD')
url='http://www.freehackers.org/Indent_Finder'
depends=('python2')
makedepends=('mercurial')
source=("$_realname::hg+http://sources.freehackers.org/IndentFinder")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_realname"
	hg identify -ni | awk 'BEGIN{OFS="_";} {print $2,$1}'
}

package() {
	cd "$srcdir/$_realname"

	python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
