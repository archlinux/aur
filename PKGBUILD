# Maintainer:  Alexander Bocken <alexander@bocken.org>

_name=Mesa-Viz-Tornado
pkgname=python-${_name,,}
pkgver=0.1.3
pkgrel=2
pkgdesc="Tornado-based visualization framework for Mesa"
arch=('any')
url="https://github.com/projectmesa/mesa-viz-tornado"
license=(Apache)
depends=('python>=3.8' python-tornado)
makedepends=('python-installer' 'python-wheel')

_whl="${_name//-/_}-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/$_whl")
sha256sums=('bfde49f0af55c2149a5b369431be7c14a65bc210eb85a9f97b452cf3cfdf6075')

noextract=("$_whl")
package() {
    _python_version="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    python -m installer --destdir="$pkgdir" "$_whl"
}
