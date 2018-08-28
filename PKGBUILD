# Maintainer: sasvari
pkg="pubs"
pkgname="$pkg"
pkgver=0.8.1
pkgrel=1
pkgdesc="Your bibliography on the command line"
arch=(any)
url="https://github.com/pubs/pubs"
license=('LGPL-3.0')
depends=("python" "python-configobj" "python-bibtexparser" "python-beautifulsoup4" "python-yaml" "python-feedparser" "python-dateutil" "python-requests")
makedepends=("git")
provides=("pubs")
source=("https://github.com/pubs/pubs/archive/v$pkgver.tar.gz")
sha256sums=('ce9193bc7a761625e6cb57e1ffccc1266ff52d933c89bb4e3fb94f221e0ae797')

build () {
	cd "$srcdir/$pkg-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$pkg-$pkgver"
	python setup.py install --root="$pkgdir/" --prefix="/usr"
}
