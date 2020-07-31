# Maintainer: Philipp A. <flying-sheep@web.de>

_name=pytest-pycharm
pkgname=python-$_name
pkgver=0.6.0
pkgrel=1
pkgdesc='Plugin for pytest to enter PyCharm debugger on uncaught exceptions.'
arch=(any)
url="https://github.com/jlubcke/$_name"
license=(BSD)
depends=(python)
makedepends=(python-pip)
_wheel="${_name/-/_}-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/$_wheel")
sha256sums=('6d363c98a6f14ae27eb7a4f30be90946fb3c93003365ae18632161fc988de3a7')
noextract=("$_wheel")

package() {
	cd "$srcdir"
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
}
