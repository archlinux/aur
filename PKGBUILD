# Maintainer:  Anna Brünisholz <anna.bruenisholz@gmail.com>

_name=pyberny
pkgname=python-${_name,,}
pkgver=0.6.3
pkgrel=1
pkgdesc="Molecular/crystal structure optimizer"
arch=('any')
url="https://github.com/jhrmnn/pyberny"
license=("MPL-2.0")
depends=('python>=3.5'
	python-numpy)
makedepends=('python-installer' 'python-wheel')

_whl="${_name//-/_}-$pkgver-py3-none-any.whl"

source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/$_whl")
sha256sums=('edb37aee86cc0f607b88b7f504dc6708a3eb167c6fc48a7d36bb9f92d0302a1d')

noextract=("$_whl")
package() {
    _python_version="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    python -m installer --destdir="$pkgdir" "$_whl"
}
