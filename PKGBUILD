# Maintainer: Philipp A. <flying-sheep@web.de>

_name=anndata
pkgname=python-$_name
pkgver=0.7.4
pkgrel=1
pkgdesc='A data structure for rectangular numeric data and sample/variable annotations.'
arch=(any)
url="https://github.com/theislab/$_name"
license=(BSD)
depends=(python-pandas python-scipy python-h5py python-natsort)
_wheel="${_name/-/_}-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/$_wheel")
sha256sums=('b7f5a7163a52da1d9211fed7e546d5800c5964243a1ae581b4ffba28d0bcb7c0')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
}
