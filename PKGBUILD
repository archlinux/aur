# Maintainer: Jon Bergli Heier <snakebite@jvnv.net>

_basename=pymodes
pkgname=python-${_basename}
pkgver=2.16
pkgrel=1
pkgdesc="Python decoder for Mode S and ADS-B signals"
arch=('any')
url="https://github.com/junzis/pyModeS"
license=('GPL3')
depends=('python' 'python-numpy' 'python-pyzmq' 'python-pyrtlsdr')
makedepends=('python-installer' 'python-poetry' 'cython')
source=("https://files.pythonhosted.org/packages/source/${_basename:0:1}/${_basename}/${_basename}-${pkgver}.tar.gz")
sha256sums=('9f11e17dd9113af6e09d9c834e6279057059a1a306aaf64712a4c4e6e823b605')

build() {
	cd "$_basename-$pkgver"
	poetry build
}

package() {
	cd "$_basename-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
}
