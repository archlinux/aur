# Maintainer: Phil Schaf <flying-sheep@web.de>

_name=future-fstrings
pkgname=python-$_name
pkgver=0.4.4
pkgrel=1
pkgdesc='A backport of fstrings to python<3.6'
arch=(any)
url="https://github.com/asottile/$_name"
license=(MIT)
depends=(python)
makedepends=(python-pip)
_wheel="${_name/-/_}-$pkgver-py2.py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/$_name/$_wheel")
sha256sums=('ee4a9e4b8de317b1d43c01765d505a533d0d22d8e504bfa51c782ab1ababa5da')
noextract=("$_wheel")

package() {
	cd "$srcdir"
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
}
