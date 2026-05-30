# Maintainer: therealmate <hellogaming91 at gmail dot com>
# Contributor: masutu <masutu dot arch at gmail dot com>

pkgname=python-pyfluidsynth
pkgver=1.3.6
pkgrel=1
pkgdesc="Python bindings for FluidSynth"
arch=('any')
url="https://github.com/nwhitehead/pyfluidsynth"
license=('LGPL-2.1-only')
provides=('pyfluidsynth')
conflicts=('pyfluidsynth')
replaces=('pyfluidsynth')
depends=(
  'fluidsynth'
  'python-numpy'
  'python'
)
makedepends=(
  'python-setuptools'
  'python-build'
  'python-installer'
  'python-wheel'
)
source=("pyfluidsynth-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('b1171f7ec51dc50fb89d34fbcb0a5930230d665df8c3c12afe3c8a011acdc3cbe970663522fae390a24b7b81d9597383700109abd751b818ff0670b2ed8f4c2d')

build() {
	cd pyfluidsynth-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd pyfluidsynth-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
}
