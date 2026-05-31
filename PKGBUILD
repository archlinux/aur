# Maintainer: ellie <ellie@ellierf.com>
pkgname=python-kflow-py
pkgver=0.1.1
pkgrel=1
pkgdesc="Declarative Kubernetes workflow orchestration with dependency-aware phases, state tracking, and pluggable Python runners"
arch=('any')
url="https://github.com/1vers1on/kflow"
license=('MIT')
depends=('python' 'python-click' 'python-rich' 'python-yaml')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/46/f7/de3c84964793fc5000ba9f506a48b7c932fff067ae9bed28871ba92eda96/kflow_py-${pkgver}.tar.gz")
sha256sums=('c88bfe0eeee9819b1171a175e657ad9f298500c7b8443796603cf9259231f78f')

build() {
    cd "kflow_py-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "kflow_py-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

