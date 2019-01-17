# Maintainer: sasvari

pkg=python-bibtexparser
pkgname=$pkg-git
_pkgname=bibtexparser
pkgrel=1
pkgver=20190116.89d2ef0
pkgdesc="Bibtex parser in Python"
arch=('any')
url="https://bibtexparser.readthedocs.org/"
license=('LGPL3')
depends=('python' 'python-future')
makedepends=('python-setuptools')
checkdepends=('python-nose')
provides=("python-bibtexparser")
conflicts=("python-bibtexparser")
source=("git+https://github.com/sciunto-org/python-bibtexparser.git")

pkgver() {
	cd "$srcdir/$pkg"
	git log -1 --format=%cd.%h --date=short|tr -d -
}

build() {
	cd "$srcdir/$pkg"
	python setup.py build
}


package(){
	cd "$srcdir/$pkg"
	python setup.py install --root="$pkgdir/" --optimize=1
}
md5sums=('SKIP')
