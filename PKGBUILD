# Maintainer: Alexander Bocken <alexander@bocken.org>

_name=nolds
pkgname=python-${_name,,}
pkgver=0.6.3
pkgrel=1
pkgdesc='Nonlinear measures for dynamical systems (based on one-dimensional time series)'
arch=('any')
url="https://github.com/CSchoel/nolds"
license=('MIT')
depends=('python'
	 'python-numpy'
	 'python-setuptools'
	 )
makedepends=('python-installer' 'python-wheel')
_whl="${_name//-/_}-$pkgver-py2.py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py2.py3-none-any.whl")
sha256sums=(ba3fc9c30ba7a2c6eb8756eeb644dcf0d18e597ebe9ae170371b4b5c760213cc)

noextract=("$_whl")
package() {
    python -m installer --destdir="$pkgdir" "$_whl"
}
