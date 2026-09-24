# Maintainer: vyzu
pkgname='python-slskd-api'
_pkgname='slskd-python-api'
pkgver='0.2.4'
pkgrel=2
pkgdesc="Python API for slskd"
url="https://github.com/bigoulours/$_pkgname"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools-git-versioning' 'python-wheel')
license=('AGPL-3.0-only')
arch=('any')
source=($_pkgname-$pkgver.tar.gz::"$url/archive/v$pkgver.tar.gz")
sha256sums=('b41a82155ffecdaf9fa5c22c927990a4b057c0351a32d4fe298ef38576242538')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
