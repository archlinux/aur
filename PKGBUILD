# Maintainer: Philipp A. <flying-sheep@web.de>
# Contributor: Vladimir Keleshev <vladimir [at] keleshev [dot] com>

_name=schema
pkgbase="python-$_name"
pkgname=("python2-$_name" "python-$_name")
pkgver=0.7.0
pkgrel=1
pkgdesc='Python module to validate and convert data structures.'
arch=(any)
url="https://github.com/keleshev/$_name"
license=(MIT)
_pyarch=py2.py3
_wheel="${_name/-/_}-$pkgver-$_pyarch-none-any.whl"
source=("https://files.pythonhosted.org/packages/$_pyarch/${_name::1}/$_name/$_wheel")
sha256sums=('5b0e0f47923164190513db2e91b9ab1941162b2dc400cc9b1803c2abab579e62')
noextract=("$_wheel")

do_package() {
	depends=($1)
	local site="$pkgdir/usr/lib/$(readlink "/bin/$1")/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
}

package_python2-schema() {
	do_package python2
}

package_python-schema() {
	do_package python3
}
