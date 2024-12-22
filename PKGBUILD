# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=dlx
pkgname=python-dlx
_commit=bc5529846486509da00ce25b73c8cd736b57c9fa
pkgver=1.0.4
pkgrel=8
pkgdesc="Implementation of Donald Knuth's Dancing Links algorithm"
arch=(any)
url=https://github.com/sraaphorst/dlx-python
license=(Apache-2.0)
depends=(python)
makedepends=(
    git
    python-build
    python-flit-scm
    python-installer
    python-setuptools
    python-wheel
)
source=($_pkgname::git+https://github.com/sraaphorst/dlx-python#commit=$_commit)
b2sums=('a52f94c9a706ab4c41326e649cc6a3790bf6466a4c99286456a44f1e20c60cfdfc8ed72563d8ac4e1c34d8b63eb16566c35d7889468d9796b7ed9d7f4afdd67c')

build() {
    cd $_pkgname
    python -m build --wheel --no-isolation
}

package() {
    cd $_pkgname
    python -m installer --destdir="$pkgdir" dist/*.whl
}
