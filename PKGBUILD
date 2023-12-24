# Maintainer: spider-mario <spidermario@free.fr>

_pkgname=amply
pkgname=python-amply
pkgver=0.1.6
pkgrel=1
pkgdesc="A Python package for AMPL/GMPL datafile parsing"
arch=("any")
license=("EPL")
url="http://github.com/willu47/amply"
depends=('python-pyparsing')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
b2sums=('e6d9408625aed372839290756f7569f21aa648c37a8fc53ac4cb5f3707550d7d9cad02c7bbfdcae77512ea53ca0b64911c2e1a9d476b1bc5cefd46356f61dda8')

build() {
	cd amply-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd amply-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
}
