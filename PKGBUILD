# Maintainer: Philipp A. <flying-sheep@web.de>

_name=entry-points-txt
pkgname=python-$_name
pkgver=0.2.0
pkgrel=1
pkgdesc='Read & write entry_points.txt files'
arch=(any)
url="https://github.com/jwodder/$_name"
license=(MIT)
depends=(python)
_pyarch=py3
_wheel="${_name//-/_}-$pkgver-$_pyarch-none-any.whl"
source=("https://files.pythonhosted.org/packages/$_pyarch/${_name::1}/$_name/$_wheel")
sha256sums=('f17191ff7c7dcfe8753f22c5432705e7cbcca7de4b6ceb48ce298d1421c40bb7')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
}
