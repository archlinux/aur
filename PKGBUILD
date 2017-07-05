# Maintainer: sasvari
pkgname="pubs-git"
pkgver=d7e25d0
pkgrel=1
pkgdesc="Your bibliography on the command line"
arch=(any)
url="https://github.com/pubs/pubs"
depends=("python")
makedepends=("git")
provides=("pubs")
source=("git+https://github.com/pubs/pubs.git")

pkgver() {
	cd "$srcdir/$pkgname"
	#git describe | sed 's/^v//; s/-/.r/; s/-/./'
	git rev-parse --short HEAD
}

build () {
	cd "$srcdir/$pkgname"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname"
	python setup.py install --root="$pkgdir/" --prefix="/usr"
}
md5sums=('SKIP')
