# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-fortran
pkgname=python-tree-sitter-fortran
pkgver=0.6.0
pkgrel=4
_commit=48593829df8a929bfe58528eedcf405171921005
pkgdesc="Fortran grammar for tree-sitter"
arch=('x86_64' 'aarch64')
url="https://github.com/stadelmanma/tree-sitter-fortran"
license=('MIT')
depends=('python' 'python-tree-sitter')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}-${_commit}.tar.gz::https://github.com/stadelmanma/tree-sitter-fortran/archive/${_commit}.tar.gz")
sha256sums=('e7f87ad365f254b4048b7a3655407ea669382ff2b4ae7cfd3f5cbdabab16dacd')

build() {
    cd "${_name}-${_commit}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${_commit}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
