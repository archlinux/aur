# Maintainer: Ivan Batrakov <blackfan321 at disroot dot org>
# Contributor: Philipp A. <flying-sheep@web.de>

_name=yte
pkgname=python-$_name
pkgver=1.5.4
pkgrel=1
pkgdesc='YAML template engine with Python expressions'
arch=(any)
url="https://github.com/koesterlab/$_name"
license=(MIT)
depends=(python-dpath python-plac python-pyyaml)
makedepends=(python-poetry-core python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('d2d77e53eafca74f58234fcd3fea28cc0a719e4f3784911511e35e86594bc880')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
