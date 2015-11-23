# Maintainer: Jeremey Hustman <jeremeyhustman at gmail daught com>

pkgname=javascriptlint

pkgver=0.3
pkgrel=1

pkgdesc="JavaScript Lint"
arch=('any')
url="http://www.javascriptlint.com/index.htm"
license=("GPL")
depends=('python2')
makedepends=('python2')
provides=("jsl", "jscpucfg")
source=('jsl::svn+https://javascriptlint.svn.sourceforge.net/svnroot/javascriptlint/tags/0.3.0')
md5sums=('SKIP')

build() {
	cd "$srcdir/$pkgbase/src"
	make -f Makefile.ref
}

package() {
	cd "$srcdir/$pkgbase/src/Linux_All_DBG.OBJ"
	install -Dm755 jsl "$pkgdir/usr/bin/jsl"
	install -Dm755 jscpucfg "$pkgdir/usr/bin/jscpucfg"
}
