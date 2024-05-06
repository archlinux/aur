# Maintainer: Tomas S. <me+aur at wereii.cz>
# Contributor: Simon Perry <aur [at] sanxion [dot] net>

pkgname=python-diskcache
pkgver=5.6.3
pkgrel=2
pkgdesc="Python disk and file backed cache library"
arch=('any')
license=('Apache-2.0')
url="https://github.com/grantjenks/python-diskcache"
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/grantjenks/python-diskcache/archive/v${pkgver}.tar.gz")
sha256sums=('ecd01a006c60c68171571da77d905878bacc2103a8e0ade55dcda26271ea2bb3')

build() {
  cd "${srcdir}"/"${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/"${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

