# Maintainer:  Alexander Bocken <alexander@bocken.org>

_name=Mesa
pkgname=python-${_name,,}
pkgver=1.1.1
pkgrel=1
pkgdesc="Agent-based modeling (ABM) in Python 3+"
arch=('any')
url="https://github.com/projectmesa/mesa"
license=(Apache)
depends=('python>=3.8' python-click python-cookiecutter python-networkx python-numpy python-pandas python-tornado python-tqdm)
makedepends=('python-installer' 'python-wheel')

_whl="${_name//-/_}-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/$_whl")
sha256sums=('65757c5fe189a1abd87829f1a4aed496bd08874ab77f4d326e0a83e76707d14d')

noextract=("$_whl")
package() {
    python -m installer --destdir="$pkgdir" "$_whl"
    rm -r "$pkgdir/usr/lib/python3.10/site-packages/tests"
}
