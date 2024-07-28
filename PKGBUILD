# Maintainer: robertfoster

pkgname=python-rtmixer
pkgver=0.1.7
pkgrel=1
pkgdesc="Reliable low-latency audio playback and recording with Python"
arch=(any)
url="https://github.com/spatialaudio/python-rtmixer"
license=('MIT')
makedepends=(portaudio python-build python-cffi python-installer python-pa-ringbuffer python-setuptools python-wheel)
source=("https://github.com/spatialaudio/python-rtmixer/archive/${pkgver}.tar.gz")

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}

sha256sums=('17cc6798a56278b5d74a07a9f607093089ab1b3fcfbaecaafb30659100935cc1')
