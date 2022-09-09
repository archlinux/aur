# Maintainer: Philipp A. <flying-sheep@web.de>

_name=get_version
pkgname=python-$_name
pkgver=3.5.4
pkgrel=3
pkgdesc='Automatically use the latest “vX.X.X” tag as version in your Python package'
arch=('any')
url="https://pypi.org/project/$_name"
license=('GPL3')
depends=(python)
makedepends=(python-flit-core python-dunamai python-installer python-build)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('5901c846518d55d52c1f6f037f5d2433952b46bbf36e38c52f064ae836556343')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
