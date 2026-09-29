# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-julia
pkgname=python-tree-sitter-julia
pkgver=0.25.0
pkgrel=4
_commit=e0f9dcd180fdcfcfa8d79a3531e11d99e79321d3
pkgdesc="Julia grammar for tree-sitter"
arch=('x86_64' 'aarch64')
url="https://github.com/tree-sitter/tree-sitter-julia"
license=('MIT')
depends=('python' 'python-tree-sitter')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}-${_commit}.tar.gz::https://github.com/tree-sitter/tree-sitter-julia/archive/${_commit}.tar.gz")
sha256sums=('13e604be147d4d42e3640857752acf57b99ab5df84f73a026a43558da7bc4e40')

build() {
    cd "${_name}-${_commit}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${_commit}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
