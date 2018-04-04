# Maintainer: sasvari
pkg="pubs"
pkgname="$pkg-git"
pkgver=20180403.47b6982
pkgrel=1
pkgdesc="Your bibliography on the command line"
arch=(any)
url="https://github.com/pubs/pubs"
license=('LGPL-3.0')
depends=("python" "python-configobj" "python-bibtexparser" "python-beautifulsoup4" "python-yaml")
makedepends=("git")
provides=("pubs")
source=("git+https://github.com/pubs/pubs.git")

pkgver() {
	cd "$srcdir/$pkg"
	#git describe | sed 's/^v//; s/-/.r/; s/-/./'
	#git rev-parse --short HEAD
	git log -1 --format=%cd.%h --date=short|tr -d -
}

build () {
	cd "$srcdir/$pkg"
	python setup.py build
}

package() {
	cd "$srcdir/$pkg"
	python setup.py install --root="$pkgdir/" --prefix="/usr"
}
md5sums=('SKIP')
