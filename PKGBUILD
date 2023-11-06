# Maintainer:  Alexander Bocken <alexander@bocken.org>

_name=ipyvuetify
pkgname=python-${_name,,}
pkgver=1.8.10
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
sha256sums=('11bdfe9490b4533a91b141c40763bea4e73d71c764e8d1aa9969b5a348a886b5')

noextract=("$_whl")
package() {
    _python_version="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    python -m installer --destdir="$pkgdir" "$_whl"
}
