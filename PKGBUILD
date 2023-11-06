# Maintainer:  Alexander Bocken <alexander@bocken.org>

_name=Mesa-Viz-Tornado
pkgname=python-${_name,,}
pkgver=0.1.2
pkgrel=1
pkgdesc="Tornado-based visualization framework for Mesa"
arch=('any')
url="https://github.com/projectmesa/mesa-viz-tornado"
license=(Apache)
depends=('python>=3.8' python-tornado)
makedepends=('python-installer' 'python-wheel')

_whl="${_name//-/_}-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/$_whl")
sha256sums=('0e2ba02af91cad09c081b6803a94a08457a50f43279841817dd65e8961d3ba54')

noextract=("$_whl")
package() {
    _python_version="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    python -m installer --destdir="$pkgdir" "$_whl"
}
