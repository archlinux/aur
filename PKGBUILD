# Maintainer: vyzu
pkgname='python-slskd-api'
_pkgname='slskd-python-api'
pkgver='0.2.3'
pkgrel=2
pkgdesc="Python API for slskd"
url="https://github.com/bigoulours/$_pkgname"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools-git-versioning' 'python-wheel')
license=('AGPL-3.0-only')
arch=('any')
source=($_pkgname-$pkgver.tar.gz::"$url/archive/v$pkgver.tar.gz")
sha256sums=('29f2aa785962f0c58183ce26271db9791f5e42abbd0beac2862d2b372a43ab8d')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
