# Maintainer: Phil Schaf <flying-sheep@web.de>

_name=anndata
pkgname=python-$_name
pkgver=0.6.13
pkgrel=1
pkgdesc='A data structure for rectangular numeric data and sample/variable annotations.'
arch=(any)
url="https://github.com/theislab/$_name"
license=(BSD)
depends=(python-pandas python-scipy python-h5py python-natsort)
makedepends=(python-pip)
_wheel="$_name-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/$_wheel")
sha256sums=('bd12763dccfbfec08aa6db960bcdf538d9346556a5ce7d8e838cfdba2b1cf6b4')
noextract=("$_wheel")

package() {
	cd "$srcdir"
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
}
