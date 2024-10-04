# Maintainer: robertfoster

pkgname=python-rtmixer
pkgver=0.1.7
pkgrel=2
pkgdesc="Reliable low-latency audio playback and recording with Python"
arch=(any)
url="https://github.com/spatialaudio/python-rtmixer"
license=('MIT')
makedepends=(portaudio python-build python-cffi python-installer python-pa-ringbuffer python-setuptools python-wheel)
source=("git+https://github.com/spatialaudio/python-rtmixer.git")

prepare() {
  cd ${pkgname}
  git submodule update --init --recursive --depth 1 --recommend-shallow
}

build() {
  cd ${pkgname}
  python -m build --wheel --no-isolation
}

package() {
  cd ${pkgname}
  python -m installer --destdir="$pkgdir" dist/*.whl
}

sha256sums=('SKIP')
