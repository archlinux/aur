# Maintainer: Thor77 <thor77 at thor77 dot org>

pkgname=minion
pkgver=2.0
pkgrel=3
pkgdesc="A relatively new constraint solver which is fast and scales well as problem size increases"
arch=('i686' 'x86_64')
url="http://constraintmodelling.org/minion/"
license=('GNU General Public License Version 2')
makedepends=('python2' 'cmake' 'mercurial')
source=("hg+https://bitbucket.org/stacs_cp/minion")
md5sums=('SKIP')

build() {
	cd "$srcdir/minion"
	mkdir -p bin
	cd bin
	python2 ../build.py
	make minion
}

package() {
	cd "$srcdir/minion/bin"
	install -d "$pkgdir/usr/bin"
	install -Dm 755 minion $pkgdir/usr/bin/
}
