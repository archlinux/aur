# Maintainer: Philipp A. <flying-sheep@web.de>

_name=get_version
pkgname=python-$_name
pkgver=2.0.6
pkgrel=1
pkgdesc='Automatically use the latest “vX.X.X” tag as version in your Python package'
arch=('any')
url="https://pypi.org/project/$_name"
license=('GPL3')
depends=(python python-setuptools)
_wheel="$_name-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/$_wheel")
sha256sums=('437143718f704b035cb20fa44eae440618a1a2a806fa360ec5c3dc4e1094e41d')
noextract=("$_wheel")

package() {
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
}
