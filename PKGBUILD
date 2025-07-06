# Maintainer: sipistab
pkgname=python-quizr-cli
pkgver=1.0.0
pkgrel=1
pkgdesc="A command-line quiz tool with spaced repetition and image support"
arch=('any')
url="https://github.com/sipistab/QUIZR"
license=('CC0')
depends=('python' 'python-yaml' 'python-rich' 'python-rapidfuzz')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/q/quizr-cli/quizr-cli-${pkgver}.tar.gz")
sha256sums=('3E7CC84886F8A4A67C460C894CB70343989591DA5CB270C0A8C67636A86CF366')

build() {
    cd "quizr-cli-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "quizr-cli-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
} 