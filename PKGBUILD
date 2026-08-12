# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-fortran
pkgname=python-tree-sitter-fortran
pkgver=0.6.0
pkgrel=2
pkgdesc="Fortran grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/stadelmanma/tree-sitter-fortran"
license=('MIT')
depends=('python' 'python-tree-sitter')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/stadelmanma/tree-sitter-fortran/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d917f56a27c6b8e5edb71ba6ea7155a8ec007d4c1376d1b759882d1a7fdd5248')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
