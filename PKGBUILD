# Maintainer:  Anna Brünisholz <anna.bruenisholz@gmail.com>

_name=morfeus-ml
pkgname=python-${_name,,}
pkgver=0.7.2
pkgrel=1
pkgdesc="A Python package for calculating molecular features"
arch=('any')
url="https://github.com/digital-chemistry-laboratory/morfeus"
license=("MIT")
depends=('python>=3.8'
	python-numpy
	python-scipy
	python-fire)
makedepends=('python-installer' 'python-wheel')

_whl="${_name//-/_}-$pkgver-py3-none-any.whl"

source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/$_whl")
sha256sums=('14842ee212c895204ef298c77d70857bd93bba861dabf142bc6f080d2b7ad974')

noextract=("$_whl")
package() {
    _python_version="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    python -m installer --destdir="$pkgdir" "$_whl"
}
