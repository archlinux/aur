# Maintainer: spider-mario <spidermario@free.fr>

_pkgname=amply
pkgname=python-amply
pkgver=0.1.4
pkgrel=1
pkgdesc="A Python package for AMPL/GMPL datafile parsing"
arch=("any")
license=("EPL")
url="http://github.com/willu47/amply"
makedepends=('python-pip' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
b2sums=('78ae51f18355968c7713351267fe8a60adc797c9e0e37092f538935026898b51413f346a0faecc748a290f3fd3e4c313cfab6d0ddacfe34f76ecdb4ecd562ffb')

prepare() {
	rm -fr python-amply
	cp -r amply-$pkgver python-amply
}

build() {
	cd python-amply
	python setup.py build
}

package() {
	cd python-amply

	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}
