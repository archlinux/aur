# Maintainer: Philipp A. <flying-sheep@web.de>

_name=legacy-api-wrap
pkgname=python-$_name
pkgver=1.1
pkgrel=1
pkgdesc='Legacy API wrapper.'
arch=(any)
url="https://github.com/flying-sheep/$_name"
license=(GPL3)
depends=(python-get_version python-setuptools python-future-fstrings)
makedepends=(python-pip)
_wheel="${_name//-/_}-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/$_wheel")
sha256sums=('1ba149887f07c5748eb8c793a0cab53ff16ce3cce1b4efe372fbd103e7c03826')
noextract=("$_wheel")

package() {
	cd "$srcdir"
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
}
