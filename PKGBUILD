# Maintainer: Philipp A. <flying-sheep@web.de>

_name=itertools-len
pkgname=python-$_name
pkgver=1.0
pkgrel=2
pkgdesc='Wrapper around the stdlib’ itertools with len() support'
arch=('any')
url="https://github.com/flying-sheep/$_name"
license=('GPL3')
depends=(python python-get_version)
_wheel="${_name/-/_}-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/$_name/$_wheel")
sha256sums=('17c85cb54f831487e8ad18e4c7dc20c3d0f2a0b24ecce336e613f714394b7b72')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
	#fix permissions
	find "$site" -type f -exec chmod 644 {} \;
}
