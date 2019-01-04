# Maintainer: Philipp A. <flying-sheep@web.de>

_name=docutils-stubs
pkgname=python-$_name
pkgver=0.0.19
pkgrel=1
pkgdesc='PEP 561 type stubs for docutils'
arch=(any)
url="https://github.com/tk0miya/$_name"
license=()
depends=(python)
makedepends=(python-pip)
_wheel="${_name/-/_}-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/$_wheel")
sha256sums=('ce16686c7a260a39cd0a33a50590fddd4f587ef7e3cdbf27dca4f2da12b45ab1')
noextract=("$_wheel")

package() {
	cd "$srcdir"
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
}
