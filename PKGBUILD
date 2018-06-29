# Maintainer: Phil Schaf <flying-sheep@web.de>

_name=anndata
pkgname=python-$_name
pkgver=0.6.4
pkgrel=1
pkgdesc='A data structure for rectangular numeric data and sample/variable annotations.'
arch=(any)
url="https://github.com/theislab/$_name"
license=(BSD)
depends=(python-pandas python-scipy python-h5py python-natsort)
makedepends=(python-pip)
_wheel="$_name-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/$_wheel")
sha256sums=('c90da6446ad05cea24147de761c83542b6225cbd80db31e6c88ceab4233a33d3')
noextract=("$_wheel")

package() {
	cd "$srcdir"
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
}
