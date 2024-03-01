# Maintainer:  Alexander Bocken <alexander@bocken.org>

_name=ipyvuetify
pkgname=python-${_name,,}
pkgver=1.9.1
pkgrel=1
pkgdesc="Jupyter widgets based on vuetify UI components"
arch=('any')
url="https://github.com/widgetti/ipyvuetify"
license=(MIT)
depends=('python>=3.8'
          python-ipyvue)
makedepends=('python-installer' 'python-wheel')

_whl="${_name//-/_}-$pkgver-py2.py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py2.py3-none-any.whl")
sha256sums=('e084b0dbaddd50e054fda267a5dd5e4324e3239859e57971fac128a14c9f1cf0')

noextract=("$_whl")
package() {
    _python_version="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    python -m installer --destdir="$pkgdir" "$_whl"
}
