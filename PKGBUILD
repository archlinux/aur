# Maintainer: sasvari
pkg="pubs"
pkgname="$pkg"
pkgver=0.9.0
pkgrel=1
pkgdesc="Your bibliography on the command line"
arch=(any)
url="https://github.com/pubs/pubs"
license=('LGPL-3.0')
depends=("python" "python-configobj" "python-bibtexparser" "python-beautifulsoup4" "python-yaml" "python-feedparser" "python-dateutil" "python-requests")
makedepends=("git")
provides=("pubs")
source=("https://github.com/pubs/pubs/archive/v$pkgver.tar.gz")
sha256sums=('754a6033510f145702eeab4e99d71ed024f9e73245e2a71821692a9a32075b2b')

build () {
	cd "$srcdir/$pkg-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$pkg-$pkgver"
	python setup.py install --root="$pkgdir/" --prefix="/usr"
}
