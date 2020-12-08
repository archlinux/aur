# Maintainer: Philipp A. <flying-sheep@web.de>

_name=entry-points-txt
pkgname=python-$_name
pkgver=0.1.0
pkgrel=1
pkgdesc='Read & write entry_points.txt files'
arch=(any)
url="https://github.com/jwodder/$_name"
license=(MIT)
depends=(python)
_pyarch=py3
_wheel="${_name//-/_}-$pkgver-$_pyarch-none-any.whl"
source=("https://files.pythonhosted.org/packages/$_pyarch/${_name::1}/$_name/$_wheel")
sha256sums=('29773bed3d9d337766a394e19d6f7ab0be3ed7d6f3ebb753ff0f7f48f056aa8e')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
}
