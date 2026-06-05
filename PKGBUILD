# Maintainer: SteamedFish <steamedfish@hotmail.com>
pkgname=python-nllw
pkgver=0.1.6
pkgrel=2
pkgdesc="Simultaneous Machine Translation (SimulMT) with NLLB model optimization — NoLanguageLeftWaiting"
arch=('any')
url="https://github.com/QuentinFuxa/NoLanguageLeftWaiting"
license=('MIT')
depends=(
  'python'
  'python-pytorch'
  'python-transformers'
  'python-huggingface-hub'
  'python-pandas'
)
optdepends=(
  'python-ctranslate2: faster CPU/GPU inference backend'
  'python-textual: interactive demo TUI'
  'python-bertviz: attention visualization'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
)
source=("https://files.pythonhosted.org/packages/d5/8f/6f34851f73156bb0289d962d1588de49bf5170dc1ff245c086f90e2b6076/nllw-${pkgver}.tar.gz")
sha256sums=('b68196b9a7e8f981fc5b57b3cea5e7db166e3dfd0371ab0444e1046d735541c6')

build() {
  cd "nllw-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "nllw-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 PKG-INFO "$pkgdir/usr/share/licenses/$pkgname/PKG-INFO"
}
