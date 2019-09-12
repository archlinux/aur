# Maintainer: Philipp A. <flying-sheep@web.de>

_name=legacy-api-wrap
pkgname=python-$_name
pkgver=1.2
pkgrel=1
pkgdesc='Legacy API wrapper.'
arch=(any)
url="https://github.com/flying-sheep/$_name"
license=(GPL3)
depends=(python-get_version python-setuptools)
makedepends=(python-pip)
_wheel="${_name//-/_}-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/$_wheel")
sha256sums=('f32cce6dd2f38d666b348c2b5ef8ecb724c23bdb648882eec64d0e0ee2ba9e24')
noextract=("$_wheel")

package() {
	cd "$srcdir"
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
}
