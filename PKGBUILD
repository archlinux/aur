# Maintainer: Jon Bergli Heier <snakebite@jvnv.net>

_basename=pymodes
pkgname=python-${_basename}
pkgver=2.21.1
pkgrel=1
pkgdesc="Python decoder for Mode S and ADS-B signals"
arch=('any')
url="https://github.com/junzis/pyModeS"
license=('GPL3')
depends=('python' 'python-numpy' 'python-pyzmq' 'python-pyrtlsdr')
makedepends=('python-installer' 'python-poetry' 'cython' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_basename:0:1}/${_basename}/${_basename}-${pkgver}.tar.gz")
sha256sums=('b7a0aa0d19e2d248a625b5e83060844316b25b221b0487709adf1fe632c4f6f3')

build() {
	cd "$_basename-$pkgver"
	poetry build
}

package() {
	cd "$_basename-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
}
