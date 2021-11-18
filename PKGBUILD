# Maintainer: Philipp A. <flying-sheep@web.de>

_name=pytest-pycharm
pkgname=python-$_name
pkgver=0.7.0
pkgrel=1
pkgdesc='Plugin for pytest to enter PyCharm debugger on uncaught exceptions.'
arch=(any)
url="https://github.com/jlubcke/$_name"
license=(BSD)
depends=(python)
_wheel="${_name/-/_}-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/$_wheel")
sha256sums=('5a642e3e21487cb2e1bf78464edb7f1b31996f8fce34780786f218144de9d7cf')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
}
