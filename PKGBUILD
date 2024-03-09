# Maintainer:  Alexander Bocken <alexander@bocken.org>

_name=reacton
pkgname=python-${_name,,}
pkgver=1.8.3
pkgrel=1
pkgdesc="React for ipywidgets"
arch=('any')
url="https://github.com/widgetti/reacton"
license=(MIT)
depends=('python>=3.8'
	  python-ipywidgets
	 'python-typing_extensions>=4.1.1')
makedepends=('python-installer' 'python-wheel')

_whl="${_name//-/_}-$pkgver-py2.py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/$_name/${_whl}")
sha256sums=('36ea1f347345b14e4a9a58c6f866fefa04ec0e46a91c99355aeb756e066b770a')

noextract=("$_whl")
package() {
    _python_version="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    python -m installer --destdir="$pkgdir" "$_whl"
}
