# Maintainer:  Alexander Bocken <alexander@bocken.org>

_name=ipyvuetify
pkgname=python-${_name,,}
pkgver=1.9.0
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
sha256sums=('a190f62a10e89e92a0e25641c84c739e31f66680858d987b8a180b24e2278dec')

noextract=("$_whl")
package() {
    _python_version="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    python -m installer --destdir="$pkgdir" "$_whl"
}
