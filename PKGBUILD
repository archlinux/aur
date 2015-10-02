# Maintainer: BrainDamage
pkgname=python-readability-lxml
pkgver=0.6.1
pkgrel=2
pkgdesc="This is a python port of a ruby port of arc90’s readability project"
arch=(any)
url="https://github.com/buriy/python-readability"
license=("custom:Apache")
depends=("python" "python-chardet" "python-cssselect" "python-lxml")
optdepends=()
md5sums=("ba7bd3b90f2689472df0b10cc87ad5f2" "180667c7abbe3fa664518bfc5da9a145")
source=("https://pypi.python.org/packages/source/r/readability-lxml/readability-lxml-$pkgver.tar.gz" "LICENSE")

build() {
	cd "$srcdir/readability-lxml-$pkgver"
	python setup.py build
}

package() {
	install -m644 -D LICENSE "$pkgdir/usr/share/licenses/python-readability-lxml/LICENSE"
	cd "$srcdir/readability-lxml-$pkgver"
	python setup.py install --root="$pkgdir/" --prefix="/usr"
	install -m644 -D README "$pkgdir/usr/share/doc/python-readability-lxml/README"
}