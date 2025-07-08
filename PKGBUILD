# Maintainer: Ivan Batrakov <blackfan321 at disroot dot org>
# Contributor: Philipp A. <flying-sheep@web.de>
_name=yte
pkgname=python-$_name
pkgver=1.9.0
pkgrel=1
pkgdesc='YAML template engine with Python expressions'
arch=(any)
url=https://github.com/yte-template-engine
license=(MIT)
depends=(python-argparse_dataclass python-dpath python-pyyaml)
makedepends=(python-uv-build python-build python-installer python-wheel)
source=($_name-$pkgver.tar.gz::$url/yte/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('6b47483eab733bdecab4938c5d8bc745098d9b31f3b7d2d8d074453cb526f717')

build() {
	cd $_name-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd $_name-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
}
