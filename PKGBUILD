# Maintainer: SteamedFish <steamedfish@hotmail.com>
pkgname=python-nllw
pkgver=0.1.5
pkgrel=1
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
  'python-wheel'
)
source=("https://files.pythonhosted.org/packages/47/84/cd9e2c8ed1ac942911f8ab9378fd875bd85a62af81025cb56b9b4435314b/nllw-${pkgver}.tar.gz")
sha256sums=('67f9c13fff6b43c2e05b2e762e7001471329dbdb34634b56a2cab639807b1b9a')

build() {
  cd "nllw-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "nllw-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 PKG-INFO "$pkgdir/usr/share/licenses/$pkgname/PKG-INFO"
}
