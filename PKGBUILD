# Maintainer: gilcu3

pkgname=python-openwakeword
_pkgname=openWakeWord
pkgdesc="OpenWakeWord"
pkgver=0.6.0
pkgrel=2
arch=(any)
url="https://github.com/dscripka/openWakeWord"
license=('MIT')
depends=(python python-onnxruntime python-tflite-runtime python-scikit-learn python-scipy speexdsp python-tqdm)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')

source=(https://github.com/dscripka/$_pkgname/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('927b8188f94140b16fc07e8916e735cac987fa8f73ed54a656932ae9e581e85f')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
