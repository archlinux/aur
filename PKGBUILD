# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-julia
pkgname=python-tree-sitter-julia
pkgver=0.25.0
pkgrel=2
pkgdesc="Julia grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/tree-sitter/tree-sitter-julia"
license=('MIT')
depends=('python' 'python-tree-sitter')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tree-sitter/tree-sitter-julia/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5ab5fefc1459cff08efa28aeacf028c6e812d9f7552a758fda8c0d65c2abae54')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
