# Maintainer: Phil Schaf <flying-sheep@web.de>
_name=aiohttp
pkgname=python-aiohttp
pkgver=0.22.1
pkgrel=1
pkgdesc='http client/server for asyncio'
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/$_name"
license=('Apache')
depends=('python>=3.4.1' 'python-chardet')
makedepends=('python-pip')
_wheelbase="$_name-$pkgver-cp35-cp35m-manylinux1"
source_i686=(  "https://files.pythonhosted.org/packages/cp35/${_name::1}/$_name/${_wheelbase}_i686.whl")
source_x86_64=("https://files.pythonhosted.org/packages/cp35/${_name::1}/$_name/${_wheelbase}_x86_64.whl")
noextract=("${_wheelbase}_"{i686,x86_64}.whl)
md5sums_i686=('0c34e293ffb2621748cc4eb9e9a6ebb1')
md5sums_x86_64=('a03fd8f590a201b5b4026e8b5157dbf2')

package() {
	cd "$srcdir"
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "${_wheelbase}_$CARCH.whl"
}
