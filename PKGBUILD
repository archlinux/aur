# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-powershell
pkgname=python-tree-sitter-powershell
pkgver=0.26.5
pkgrel=4
_commit=d398441825243b00e317e87e1829b9d6a3e54ce0
pkgdesc="Powershell grammar for tree-sitter"
arch=('x86_64' 'aarch64')
url="https://github.com/airbus-cert/tree-sitter-powershell"
license=('MIT')
depends=('python' 'python-tree-sitter')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}-${_commit}.tar.gz::https://github.com/airbus-cert/tree-sitter-powershell/archive/${_commit}.tar.gz")
sha256sums=('a74fe59e93f76796b2593babeaaf352ed5598933ae22df9cbf8c6828c9d5f9cd')

build() {
    cd "${_name}-${_commit}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${_commit}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
