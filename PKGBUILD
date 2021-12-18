# Maintainer: Philipp A. <flying-sheep@web.de>

_name=asyncore-wsgi
pkgname=python-$_name
pkgver=0.0.10
pkgrel=1
pkgdesc='Asynchronous WSGI and WebSocket server based on asyncore module.'
arch=(any)
url="https://github.com/romanvm/$_name"
license=(MIT)
depends=(python)
_pyarch=py2.py3
_wheel="${_name/-/_}-$pkgver-$_pyarch-none-any.whl"
source=("https://files.pythonhosted.org/packages/$_pyarch/${_name::1}/$_name/$_wheel")
sha256sums=('66c7cfcb209c5b0aa8bdfb48d7ebe3ef2dcd2b085c29fde2930073db2220157c')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
}
