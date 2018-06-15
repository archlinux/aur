# Maintainer: Philipp A. <flying-sheep@web.de>
# Contributor: Vladimir Keleshev <vladimir [at] keleshev [dot] com>

_name=schema
pkgbase="python-$_name"
pkgname=("python2-$_name" "python-$_name")
pkgver=0.6.8
pkgrel=2
pkgdesc='Python module to validate and convert data structures.'
arch=(any)
url="https://github.com/keleshev/$_name"
license=(MIT)
makedepends=(python-pip python2-pip)
_wheel="$_name-$pkgver-py2.py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/$_name/$_wheel")
sha256sums=('d994b0dc4966000037b26898df638e3e2a694cc73636cb2050e652614a350687')
noextract=("$_wheel")

do_package() {
	depends=($1)
	$2 install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
}

package_python2-schema() {
	do_package python2 pip2
}

package_python-schema() {
	do_package python pip
}
