# Maintainer: Philipp A. <flying-sheep@web.de>

_name=pytest-faulthandler
pkgname=python-$_name
pkgver=1.5.0
pkgrel=1
pkgdesc='pytest plugin that activates the fault handler module for tests'
arch=(any)
url="https://github.com/pytest-dev/$_name"
license=(MIT)
depends=(python-pytest)
_pyarch=py2.py3
_wheel="${_name/-/_}-$pkgver-$_pyarch-none-any.whl"
source=("https://files.pythonhosted.org/packages/$_pyarch/${_name::1}/$_name/$_wheel")
sha256sums=('461351d67a8f09cd2aa8b343b50ce58c301c8c206fcbf7483ee17c109d6a5ddb')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
}
