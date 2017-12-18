# Maintainer: sasvari
pkg="pubs"
pkgname="$pkg"
pkgver=0.7.0
pkgrel=1
pkgdesc="Your bibliography on the command line"
arch=(any)
url="https://github.com/pubs/pubs"
license=('LGPL-3.0')
depends=("python" "python-configobj" "python-bibtexparser" "python-beautifulsoup4" "python-yaml")
makedepends=("git")
provides=("pubs")
source=("https://github.com/pubs/pubs/archive/v$pkgver.tar.gz")
sha256sums=('bab7571227eead1eff71191461c57db20461ea8ce6937be7c11be7ff9349cfe3')

build () {
	cd "$srcdir/$pkg-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$pkg-$pkgver"
	python setup.py install --root="$pkgdir/" --prefix="/usr"
}
