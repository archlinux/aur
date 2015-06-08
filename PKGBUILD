# Maintainer: Phil Schaf <flying-sheep@web.de>
pkgname=python-graph
pkgver=1.8.2
pkgrel=3
pkgdesc='python-graph is a library for working graphs in Python'
arch=('any')
url='https://github.com/pmatiello/python-graph'
license=('MIT')
depends=('python' 'python-distribute' 'python-pydot')
source=(
	"https://pypi.python.org/packages/source/p/python-graph-core/python-graph-core-$pkgver.tar.gz"
	"https://pypi.python.org/packages/source/p/python-graph-dot/python-graph-dot-$pkgver.tar.gz")
md5sums=(
	'16f177496beb6e6bc507b12b8346ff96'
	'0ecd251a9fd210a9135e1d1957689709')

package() {
	cd "$srcdir/python-graph-core-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
	
	cd "$srcdir/python-graph-dot-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
}