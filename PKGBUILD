# Maintainer: ellie <ellie@ellierf.com>
pkgname=python-kflow-py
pkgver=1.2.2
pkgrel=1
pkgdesc="Declarative Kubernetes workflow orchestration with dependency-aware phases, state tracking, and pluggable Python runners"
arch=('any')
url="https://github.com/1vers1on/kflow"
license=('MIT')
depends=('python' 'python-click' 'python-rich' 'python-yaml')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/03/74/d5eab9da8ae14a4c67fe61dc48830e0c171829985584194e0f559e3bc944/kflow_py-${pkgver}.tar.gz")
sha256sums=('c1b07fef551a770f4f721d6ec86a29ccd973ef37de98cb56c27ccb2b555fa99f')

build() {
    cd "kflow_py-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "kflow_py-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

