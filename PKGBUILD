# Maintainer: Philipp A. <flying-sheep@web.de>

_name=get_version
pkgname=python-$_name
pkgver=2.0.3
pkgrel=1
pkgdesc='Automatically use the latest “vX.X.X” tag as version in your Python package'
arch=('any')
url="https://pypi.org/project/$_name"
license=('GPL3')
depends=(python python-setuptools)
_wheel="$_name-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/$_wheel")
sha256sums=('4bc0e529f9678eb8188265205924499e37e22054a29036ed4ca2437ff96ab7e5')
noextract=("$_wheel")

package() {
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
}
