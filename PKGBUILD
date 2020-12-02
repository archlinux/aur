# Maintainer: BrainDamage
pkgname=python-readability-lxml
pkgver=0.8.1
pkgrel=2
pkgdesc="This is a python port of a ruby port of arc90’s readability project"
arch=(any)
url="https://pypi.org/project/readability-lxml/"
license=("custom:Apache")
depends=("python" "python-chardet" "python-cssselect" "python-lxml")
sha256sums=("e51fea56b5909aaf886d307d48e79e096293255afa567b7d08bca94d25b1a4e1" "1f2afa61a3e7d62e5cf62b471c60c40853effc3428289f5961c84e24cf60447a")
source=("https://pypi.python.org/packages/source/r/readability-lxml/readability-lxml-$pkgver.tar.gz" "LICENSE")
	
build() {
	cd "$srcdir/readability-lxml-$pkgver"
	python setup.py build
}

package() {
	install -m644 -D LICENSE "$pkgdir/usr/share/licenses/python-readability-lxml/LICENSE"
	cd "$srcdir/readability-lxml-$pkgver"
	python setup.py install --optimize=1 --root="$pkgdir/" --prefix="/usr"
	install -m644 -D README.rst "$pkgdir/usr/share/doc/python-readability-lxml/README.rst"
}