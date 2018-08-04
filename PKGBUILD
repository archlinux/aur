# Maintainer: BrainDamage
pkgname=python-readability-lxml
pkgver=0.7
pkgrel=1
pkgdesc="This is a python port of a ruby port of arc90’s readability project"
arch=(any)
url="https://pypi.org/project/readability-lxml/"
license=("custom:Apache")
depends=("python" "python-chardet" "python-cssselect" "python-lxml")
sha256sums=("b6b30684e302802cdab490dc5093555bfebba663eb569814225939c6b0dead3f" "1f2afa61a3e7d62e5cf62b471c60c40853effc3428289f5961c84e24cf60447a")
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