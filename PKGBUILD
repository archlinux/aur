
# Maintainer: Andres F. Urquijo <alfagalileox@gmail.com>
_pkgname=mpltex
pkgname=python2-mpltex-git
pkgver=0.2.3
pkgrel=1
pkgdesc="Python package for producing publication quality images using matplotlib"
arch=("any")
url="https://github.com/liuyxpp/mpltex.git"
license=('BSD')
depends=("python2" "git" "python2-matplotlib"  "python2-brewer2mpl")

source=("$pkgname"::'git://github.com/liuyxpp/mpltex.git')

md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	python2 setup.py build
}

package() {
	cd "$srcdir/$pkgname"
	python2 setup.py install --prefix=/usr --root="$pkgdir"
}
