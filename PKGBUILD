# Maintainer: Alexander Bocken <alexander@bocken.org>

_name=nolds
pkgname=python-${_name,,}
pkgver=0.6.2
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
sha256sums=(91fa5982432d306f9889129bf2f270080cfa11cba69c528a00bdf2abe0e3819b)

noextract=("$_whl")
package() {
    python -m installer --destdir="$pkgdir" "$_whl"
}
