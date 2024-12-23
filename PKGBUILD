# Maintainer:  Alexander Bocken <alexander@bocken.org>

_name=pathpy2
pkgname=python-$_name
pkgver=2.2.0
pkgrel=4
pkgdesc="An OpenSource python package for the analysis and visualisation of time series data on complex networks with higher- and multi-order graphical models."
arch=('any')
url="https://www.pathpy.net"
license=(AGPL)
depends=('python>=3.5' python-numpy python-scipy)
makedepends=('python-installer' 'python-wheel')

_whl="${_name//-/_}-$pkgver-py2.py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/$_name/$_whl")
sha256sums=('76a749426af0952b8f16cc80dccfef16f0553490b13f1a649069081508ce5ddf')

noextract=("$_whl")
package() {
    _python_version="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    python -m installer --destdir="$pkgdir" "$_whl"
    rm -r $pkgdir/usr/lib/python$_python_version/site-packages/tests
}
