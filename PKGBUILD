# Maintainer: Philipp A. <flying-sheep@web.de>

_name=tiledb
pkgname=python-$_name
pkgver=0.11.3
pkgrel=1
pkgdesc='Pythonic interface to the TileDB array storage manager'
arch=(x86_64)
url="https://github.com/TileDB-Inc/TileDB-Py"
license=(MIT)
_pyminor=10
depends=("python>=3.$_pyminor" "python<3.$((_pyminor + 1))" 'python-numpy>=1.21')
_wheel="${_name/-/_}-$pkgver-cp3$_pyminor-cp3$_pyminor-manylinux_2_17_$CARCH.manylinux2014_$CARCH.whl"
source=("https://files.pythonhosted.org/packages/cp3$_pyminor/${_name::1}/$_name/$_wheel")
sha256sums=('c032c22ecf7eba87fd6e829fe4821e414042550d2456b61ee96f74b78cf3753e')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/python3.$_pyminor/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
}
