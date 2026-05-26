# Maintainer: Octopus118 <idlansdowne at gmail dot com>
pkgname=python-bloom
pkgver=0.14.0
pkgrel=1
pkgdesc="Bloom is a release automation tool."
arch=('any')
url="https://github.com/ros-infrastructure/bloom"
license=('BSD')
depends=('python' 'python-empy3' 'python-rosdep' 'python-vcstool')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname::git+https://github.com/ros-infrastructure/bloom.git#tag=$pkgver")
sha256sums=('fcd6bb7d4b24f90ca817bc04efbb84d420b72e2b1da766c9c01d675fc1c3cb25')

build() {
	cd "$pkgname"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
