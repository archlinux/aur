# Maintainer: Philipp A. <flying-sheep@web.de>

_name=asyncore-wsgi
pkgname=python-$_name
pkgver=0.0.9
pkgrel=1
pkgdesc='Asynchronous WSGI and WebSocket server based on asyncore module.'
arch=(any)
url="https://github.com/romanvm/$_name"
license=(MIT)
depends=(python)
_pyarch=py2.py3
_wheel="${_name/-/_}-$pkgver-$_pyarch-none-any.whl"
source=("https://files.pythonhosted.org/packages/$_pyarch/${_name::1}/$_name/$_wheel")
sha256sums=('de043ee1544ae1a2602ef6f8cde41b7bd9f9b29d459e1c1514fa1c655aa7c841')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
}
