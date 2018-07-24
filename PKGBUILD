# Maintainer: Philipp A. <flying-sheep@web.de>

_name=get_version
pkgname=python-$_name
pkgver=2.0.1
pkgrel=1
pkgdesc='Automatically use the latest “vX.X.X” tag as version in your Python package'
arch=('any')
url="https://pypi.org/project/$_name"
license=('GPL3')
depends=(python python-setuptools)
_wheel="$_name-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/$_wheel")
sha256sums=('e918b5ae0a724d94f0356d498036fcb51b257848149b90b6f8b6c9358f79fcee')
noextract=("$_wheel")

package() {
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
}
