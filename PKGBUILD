# Maintainer: sasvari
pkg="pubs"
pkgname="$pkg"
pkgver=0.8.0
pkgrel=1
pkgdesc="Your bibliography on the command line"
arch=(any)
url="https://github.com/pubs/pubs"
license=('LGPL-3.0')
depends=("python" "python-configobj" "python-bibtexparser" "python-beautifulsoup4" "python-yaml" "python-feedparser")
makedepends=("git")
provides=("pubs")
source=("https://github.com/pubs/pubs/archive/v$pkgver.tar.gz")
sha256sums=('13c0d12a3548e0bced0453ef31cb74eb7bac68006859269eb323b4ecfde2d8dc')

build () {
	cd "$srcdir/$pkg-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$pkg-$pkgver"
	python setup.py install --root="$pkgdir/" --prefix="/usr"
}
