# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-java
pkgname=python-tree-sitter-java
pkgver=0.23.5
pkgrel=8
pkgdesc="Java grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/tree-sitter/tree-sitter-java"
license=('MIT')
depends=('python' 'python-tree-sitter')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tree-sitter/tree-sitter-java/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cb199e0faae4b2c08425f88cbb51c1a9319612e7b96315a174a624db9bf3d9f0')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
