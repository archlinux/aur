# Maintainer: KIV <kiv.apple@gmail.com>

pkgname=python-msp430-tools
pkgver=0.6
pkgrel=3
pkgdesc="The python-msp430-tools are a collection of tools related to the MSP430 embedded processor."
url="https://pypi.python.org/pypi/python-msp430-tools"
arch=('any')
license=('BSD')
depends=('python2' 'python2-pyserial')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()

source=("https://pypi.python.org/packages/source/p/python-msp430-tools/python-msp430-tools-0.6.tar.gz")
md5sums=("017c9f457d70016e346e8d03777fd91b")

package() {
	cd "${srcdir}/${pkgname}"
	for f in `pwd`/scripts/*.py; do
		_f=`echo $f | rev | cut -c 4- | rev`
		ln -sfv $f $_f
	done
	python2 setup.py build
	python2 setup.py install --prefix=${pkgdir}/usr
}
