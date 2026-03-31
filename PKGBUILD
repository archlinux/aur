# Maintainer: Haseeb Khalid <haseeb.k.khalid@gmail.com>
pkgname=python-velocirag
pkgver=0.7.2
pkgrel=1
pkgdesc="Lightning-fast RAG for AI agents. ONNX-powered, 4-layer fusion, MCP server. No PyTorch."
arch=('any')
url="https://github.com/HaseebKhalid1507/VelociRAG"
license=('MIT')
depends=(
    'python'
    'python-numpy'
    'python-click'
    'python-yaml'
    'python-networkx'
    'python-scikit-learn'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("https://github.com/HaseebKhalid1507/VelociRAG/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "VelociRAG-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "VelociRAG-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
