# Maintainer: Philipp A. <flying-sheep@web.de>

_name=docutils-stubs
pkgname=python-$_name
pkgver=0.0.21
pkgrel=1
pkgdesc='PEP 561 type stubs for docutils'
arch=(any)
url="https://github.com/tk0miya/$_name"
license=()
depends=(python)
_pyarch=py3
_wheel="${_name/-/_}-$pkgver-$_pyarch-none-any.whl"
source=("https://files.pythonhosted.org/packages/$_pyarch/${_name::1}/$_name/$_wheel")
sha256sums=('d8beb6ffac94d2db39179681f6bc17a3b81d3386201dc8b1aec3d61201b1edc9')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
}
