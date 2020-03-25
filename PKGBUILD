# Maintainer: sasvari
pkg="pubs"
pkgname="$pkg-git"
pkgver=0.8.3.r1.g28bb12c
pkgrel=1
pkgdesc="Your bibliography on the command line"
arch=(any)
url="https://github.com/pubs/pubs"
license=('LGPL-3.0')
depends=("python" "python-configobj" "python-bibtexparser" "python-beautifulsoup4" "python-yaml" "python-feedparser" "python-dateutil" "python-requests")
makedepends=("git")
provides=("pubs")
source=("git+https://github.com/pubs/pubs.git")

pkgver() {
	cd "$srcdir/$pkg"
	git describe --tags | sed 's/^v//; s/-/.r/; s/-/./'
	#git rev-parse --short HEAD
	#git log -1 --format=%cd.%h --date=short|tr -d -
	#cat $srcdir/$pkg/pubs/version.py | awk '{ print $3 }'
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
