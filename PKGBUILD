# Maintainer: therealmate <hellogaming91 at gmail dot com>
# Contributor: masutu <masutu dot arch at gmail dot com>

pkgname=python-pyfluidsynth
pkgver=1.3.4
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
sha512sums=('efff016f5ea0103affa5a8076674d2a5dc71a2d29b4be2d97bff48691ba09c8b5ce394b4459e0e56e8914ed02991b489c8874c3ace0de8ffec12f2ce38ef67ae')

build() {
	cd pyfluidsynth-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd pyfluidsynth-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
}
