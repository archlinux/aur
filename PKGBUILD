# Maintainer: Philipp A. <flying-sheep@web.de>

_name=pytest-pycharm
pkgname=python-$_name
pkgver=0.5.0
pkgrel=1
pkgdesc='Plugin for pytest to enter PyCharm debugger on uncaught exceptions.'
arch=(any)
url="https://github.com/jlubcke/$_name"
license=(BSD)
depends=(python)
makedepends=(python-pip)
_wheel="${_name/-/_}-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/$_wheel")
sha256sums=('9e51c032f5c5953e65aac4b486dd7d7abe4322fc7e951328f229630b3e6bd09f')
noextract=("$_wheel")

package() {
	cd "$srcdir"
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
}
