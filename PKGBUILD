# Maintainer: Philipp A. <flying-sheep@web.de>

_name=pyreadr
pkgname=python-$_name
pkgver=0.2.3
pkgrel=2
pkgdesc='Read and write R RData and Rds files into/from pandas dataframes.'
arch=(x86_64)
url="https://github.com/ofajardo/$_name"
license=(AGPL)
depends=(python-pandas)
makedepends=(unzip)
_wheel="${_name/-/_}-$pkgver-cp38-cp38-manylinux1_$CARCH.whl"
source=("https://files.pythonhosted.org/packages/cp38/${_name::1}/$_name/$_wheel")
sha256sums=('519ea1a9d5760cf29b8d0247132104520042aaf8c4b515095ab4d66daa20fe2e')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
}
