# Maintainer: gilcu3

pkgname=python-openwakeword
_pkgname=openWakeWord
pkgdesc="OpenWakeWord"
pkgver=0.5.1
pkgrel=1
arch=(any)
url="https://github.com/dscripka/openWakeWord"
license=('MIT')
depends=(python python-wyoming python-onnxruntime python-tflite-runtime)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')

source=(https://github.com/dscripka/$_pkgname/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('0c83fe69411e811d1fb376acdabbb8777a34a7b8f9fdcc7987ab488c01787f87')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
