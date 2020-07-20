# Maintainer: Philipp A. <flying-sheep@web.de>

_name=tiledb
pkgname=python-$_name
pkgver=0.6.5
pkgrel=1
pkgdesc='Pythonic interface to the TileDB array storage manager'
arch=(x86_64)
url="https://github.com/TileDB-Inc/TileDB-Py"
license=(MIT)
depends=(python python-setuptools 'python-numpy>=1.16')
makedepends=(unzip)
_wheel="${_name/-/_}-$pkgver-cp38-cp38-manylinux1_$CARCH.whl"
source=("https://files.pythonhosted.org/packages/cp38/${_name::1}/$_name/$_wheel")
sha256sums=('d8fea3df7543e8704954921c1cd5da1a8f495e38b2e5f28c58550931857a17d6')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
}
