# Maintainer: Philipp A. <flying-sheep@web.de>

_name=scanpydoc
pkgname=python-$_name
pkgver=0.3.1
pkgrel=1
pkgdesc='A series of Sphinx extensions to get easy to maintain, numpydoc style documentation.'
arch=(any)
url="https://github.com/theislab/$_name"
license=(GPL3)
depends=(python-sphinx python-get_version python-future-fstrings)
makedepends=(python-pip)
_wheel="$_name-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/$_wheel")
sha256sums=('0c1efda0ac0b0da0674e145419c4feb7f7eb45b0026eff62d1297b0dd052c324')
noextract=("$_wheel")

package() {
	cd "$srcdir"
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
}
