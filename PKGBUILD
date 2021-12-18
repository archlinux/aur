# Maintainer: Phil Schaf <flying-sheep@web.de>
_name=jupyter_kernel_test
pkgname=python-$_name
pkgver=0.4.3
pkgrel=1
pkgdesc='A tool for testing Jupyter kernels'
arch=('any')
url="https://github.com/jupyter/$_name"
license=(BSD3)
depends=(python jupyter)
_wheel="$_name-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/$_wheel")
noextract=("$_wheel")
sha256sums=('8c88b17bcfe63c2b670a27ef5585e6daf7b8090544af2d3741dfef971d022cec')

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	install -d "$site"
	unzip "$_wheel" -d "$site"
}
