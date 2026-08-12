# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-kotlin
pkgname=python-tree-sitter-kotlin
pkgver=1.1.0
pkgrel=8
arch=('x86_64')
pkgdesc="Kotlin grammar for tree-sitter"
url="https://github.com/tree-sitter-grammars/tree-sitter-kotlin"
license=('MIT')
depends=('python' 'python-tree-sitter')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tree-sitter-grammars/tree-sitter-kotlin/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3c36bd5627fff38e4323ebead1f7e86e6d1727f0353618d1c976fea88260ba90')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
