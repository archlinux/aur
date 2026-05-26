# Maintainer: Octopus118 <idlansdowne at gmail dot com>
pkgname=python-bloom
pkgver=0.14.2
pkgrel=1
pkgdesc="Bloom is a release automation tool."
arch=('any')
url="https://github.com/ros-infrastructure/bloom"
license=('BSD')
depends=('python' 'python-empy3' 'python-rosdep' 'python-vcstool')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname::git+https://github.com/ros-infrastructure/bloom.git#tag=$pkgver")
sha256sums=('161f361ef777679a5a28470ed6da9b684716878ca812e449aac4bdda4ecbe9d6')

build() {
	cd "$pkgname"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
