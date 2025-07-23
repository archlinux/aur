# Maintainer:  Alexander Bocken <alexander@bocken.org>

_name=ipyvuetify
pkgname=python-${_name,,}
pkgver=1.11.3
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
sha256sums=(fa83aaf9f4ce669172d532094d60bd7c40d3cb9c5d6bb2f4a14565da2b09a8d8)

noextract=("$_whl")
package() {
    _python_version="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    python -m installer --destdir="$pkgdir" "$_whl"
}
