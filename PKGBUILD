# Maintainer: Philipp A. <flying-sheep@web.de>

_name=spectate
pkgname=python-$_name
pkgver=1.0.1
pkgrel=1
pkgdesc='Observe the evolution of mutable data types like lists, dicts, and sets.'
arch=(any)
url="https://github.com/rmorshea/$_name"
license=(MIT)
depends=(python)
_wheel="${_name/-/_}-$pkgver-py2.py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/$_name/$_wheel")
sha256sums=('c4585194c238979f953fbf2ecf9f94c84d9d0a929432c7104e39984f52c9e718')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
}
