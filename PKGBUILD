# Maintainer: Philipp A. <flying-sheep@web.de>

_name=wheel-filename
pkgname=python-$_name
pkgver=1.2.0
pkgrel=1
pkgdesc='Parse wheel filenames'
arch=(any)
url="https://github.com/jwodder/$_name"
license=(MIT)
depends=(python)
_pyarch=py3
_wheel="${_name/-/_}-$pkgver-$_pyarch-none-any.whl"
source=("https://files.pythonhosted.org/packages/$_pyarch/${_name::1}/$_name/$_wheel")
sha256sums=('0aab092d824560d93d6b8999519bfa363743c27e00806131690577f03f5dbc8d')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
}
