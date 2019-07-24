# Maintainer: Philipp A. <flying-sheep@web.de>

_name=anndata
pkgname=python-$_name
pkgver=0.6.22.post1
pkgrel=1
pkgdesc='A data structure for rectangular numeric data and sample/variable annotations.'
arch=(any)
url="https://github.com/theislab/$_name"
license=(BSD)
depends=(python-pandas python-scipy python-h5py python-natsort)
makedepends=(python-pip)
_wheel="${_name/-/_}-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/$_wheel")
sha256sums=('94d4790ed1173e0a0f1cbe1095e9fd34fe2d226e3f06d800a06f345b6aaa5c8b')
noextract=("$_wheel")

package() {
	cd "$srcdir"
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
}
