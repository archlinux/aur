# Maintainer: therealmate <hellogaming91 at gmail dot com>
# Contributor: masutu <masutu dot arch at gmail dot com>

pkgname=python-pyfluidsynth
pkgver=1.4.0
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
sha512sums=('9ac32dc80f1848dd53ade68539c94914103e061202c46898d8cd9185f576e0e19c5b60821ee172089b196db80578d6b798ee09f4be6a3518d171ed1dd0e4ea52')

build() {
	cd pyfluidsynth-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd pyfluidsynth-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
}
