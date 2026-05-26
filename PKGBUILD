# Maintainer: Octopus118 <idlansdowne at gmail dot com>
pkgname=python-bloom
pkgver=0.14.1
pkgrel=1
pkgdesc="Bloom is a release automation tool."
arch=('any')
url="https://github.com/ros-infrastructure/bloom"
license=('BSD')
depends=('python' 'python-empy3' 'python-rosdep' 'python-vcstool')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname::git+https://github.com/ros-infrastructure/bloom.git#tag=$pkgver")
sha256sums=('1da1a9d59fd4002393049c31c657ca9ab2eda1510b302f6f5e6d960f49ba687a')

build() {
	cd "$pkgname"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
