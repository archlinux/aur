# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-objc
pkgname=python-tree-sitter-objc
pkgver=3.0.2
pkgrel=8
pkgdesc="Objc grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/tree-sitter-grammars/tree-sitter-objc"
license=('MIT')
depends=('python' 'python-tree-sitter')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tree-sitter-grammars/tree-sitter-objc/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('186d03ecb9ae41cde85efbe283dcbe67c277fff766a946f7efd6d51fee72370d')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
