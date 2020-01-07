# Maintainer: sasvari
name=camelot
pkgname=python-$name-git
pkgver=0.7.3.r2.gcd8ac79
pkgrel=1
pkgdesc="Camelot: PDF Table Extraction for Humans"
arch=(any)
url="https://camelot-py.readthedocs.io"
license=("MIT")
depends=("python" "opencv" "python-click" "python-matplotlib" "python-numpy" "python-openpyxl" "python-pandas" "python-pdfminer.six" "python-pypdf2")
makedepends=("git")
provides=("python-camelot")
conflicts=("python-camelot")
source=("git+https://github.com/socialcopsdev/$name.git")

pkgver() {
	cd "$srcdir/$name"
	git describe --tags | sed 's/^v//; s/-/.r/; s/-/./'
}

build () {
	cd "$srcdir/$name"
	python setup.py build
}

package() {
	cd "$srcdir/$name"
	python setup.py install --root="$pkgdir/" --prefix="/usr"
}
md5sums=('SKIP')
