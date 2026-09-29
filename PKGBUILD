# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-objc
pkgname=python-tree-sitter-objc
pkgver=3.0.2
pkgrel=10
_commit=18802acf31d0b5c1c1d50bdbc9eb0e1636cab9ed
pkgdesc="Objc grammar for tree-sitter"
arch=('x86_64' 'aarch64')
url="https://github.com/tree-sitter-grammars/tree-sitter-objc"
license=('MIT')
depends=('python' 'python-tree-sitter')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}-${_commit}.tar.gz::https://github.com/tree-sitter-grammars/tree-sitter-objc/archive/${_commit}.tar.gz")
sha256sums=('c96a6b1fdebccd56419f552c416a044e94401990dcf5ccfb633f5d2b395f5578')

build() {
    cd "${_name}-${_commit}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${_commit}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
