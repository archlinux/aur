# Maintainer: sasvari
pkg="pubs"
pkgname="$pkg"
pkgver=0.8.3
pkgrel=1
pkgdesc="Your bibliography on the command line"
arch=(any)
url="https://github.com/pubs/pubs"
license=('LGPL-3.0')
depends=("python" "python-configobj" "python-bibtexparser" "python-beautifulsoup4" "python-yaml" "python-feedparser" "python-dateutil" "python-requests")
makedepends=("git")
provides=("pubs")
source=("https://github.com/pubs/pubs/archive/v$pkgver.tar.gz")
sha256sums=('8241633805b19266cc042f8216b3934078f40327dfba7be87dda59c87e363ce5')

build () {
	cd "$srcdir/$pkg-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$pkg-$pkgver"
	python setup.py install --root="$pkgdir/" --prefix="/usr"
}
