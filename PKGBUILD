# Maintainer: Philipp A. <flying-sheep@web.de>

_name=headerparser
pkgname=python-$_name
pkgver=0.4.0
pkgrel=1
pkgdesc='argparse for mail-style headers'
arch=(any)
url="https://github.com/jwodder/$_name"
license=(MIT)
depends=(python)
_pyarch=py2.py3
_wheel="${_name/-/_}-$pkgver-$_pyarch-none-any.whl"
source=("https://files.pythonhosted.org/packages/$_pyarch/${_name::1}/$_name/$_wheel")
sha256sums=('75857316449cdad212a3ba5c7b3b3177e45dd86e1f83b003f0b6b5108f14766e')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
}
