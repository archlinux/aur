# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-php
pkgname=python-tree-sitter-php
pkgver=0.25.0
pkgrel=1
pkgdesc="Php grammar for tree-sitter"
arch=('x86_64' 'aarch64')
url="https://github.com/tree-sitter/tree-sitter-php"
license=('MIT')
depends=('python' 'python-tree-sitter')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tree-sitter/tree-sitter-php/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f89c16df668b9df9bffe825925c7cf8a9f0e01da87b8a1fe417f4202ce0de6df')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
