# Maintainer: Jelle van der Waa <jelle@archlinux.org>

pkgname=python-meilisearch
pkgver=0.9.0
pkgrel=1
pkgdesc='Python client for MeiliSearch API'
arch=(any)
license=('MIT')
url='https://pypi.org/project/meilisearch/'
depends=(python)
makedepends=(python-requests)
checkdepends=('python-pytest' 'python-pytest-ordering')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/meilisearch/meilisearch-python/archive/v${pkgver}.tar.gz)
sha512sums=('d903954c4d4aef9d746a0798d11a47a326445b83c03c3862613c936671e39a2cae6fef464e6583f4fdb1ca13fb12762290e3ff02e769884d932ab8a10ea95bb1')

build() {
  cd "meilisearch-python-${pkgver}"
  python setup.py build
}

package() {
  cd "meilisearch-python-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
}
