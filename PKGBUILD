# Maintainer: BrainDamage
pkgname=python2-readability-lxml
pkgver=0.6.1
pkgrel=1
pkgdesc="This is a python port of a ruby port of arc90’s readability project"
arch=(any)
url="https://github.com/buriy/python-readability"
license=("custom:Apache")
depends=("python2" "python2-chardet" "python2-cssselect" "python2-lxml")
optdepends=()
md5sums=("ba7bd3b90f2689472df0b10cc87ad5f2" "180667c7abbe3fa664518bfc5da9a145")
source=("https://pypi.python.org/packages/source/r/readability-lxml/readability-lxml-$pkgver.tar.gz" "LICENSE")

build() {
	cd "$srcdir/readability-lxml-$pkgver"
	python2 setup.py build
}

package() {
	install -m644 -D LICENSE "$pkgdir/usr/share/licenses/python2-readability-lxml/LICENSE"
	cd "$srcdir/readability-lxml-$pkgver"
	python2 setup.py install --root="$pkgdir/" --prefix="/usr"
	install -m644 -D README "$pkgdir/usr/share/doc/python2-readability-lxml/README"
}
