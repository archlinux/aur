# Maintainer: Phil Schaf <flying-sheep@web.de>
pkgname=python-pydot
pkgver=1.0.32
pkgrel=2
pkgdesc='Python interface to Graphviz’s Dot language'
arch=('any')
url='https://github.com/erocarrera/pydot'
license=('MIT')
depends=('python' 'python-pyparsing' 'graphviz')
makedepends=('setuptools')
provides=('python-dot')
conflicts=('python-dot')
source=("https://pypi.python.org/packages/source/p/pydot2/pydot2-$pkgver.tar.gz" 'readme.patch')
md5sums=('1b0c18323e7ac14495f79c2362c6ac07'
         'a6c9ad9cc7c6ed180038dc361d12017d')

package() {
	cd "$srcdir/pydot2-$pkgver"
	
	patch -i ../readme.patch
	
	python setup.py install --install-data='/usr/share/pydot' --root="$pkgdir"
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}