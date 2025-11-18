# Contributor: Andrew Steinke <rkcf@rkcf.me>

pkgname=python-esprima
_pkgname=esprima-python
pkgrel=3
pkgver=4.0.1
pkgdesc="Python port of esprima. ECMAScript parsing infrastructure for multipurpose analysis"
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/Kronuz/esprima-python"
license=('BSD-2-Clause')
arch=('any')
source=("$url/archive/v$pkgver.tar.gz")
md5sums=('40b066e480bbe52168a441b99814dd23')

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
