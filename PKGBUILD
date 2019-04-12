# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=python-elasticsearch-dsl
pkgver=6.3.1
pkgrel=1
pkgdesc='High-level Python client for Elasticsearch'
arch=(any)
url=https://elasticsearch-dsl.readthedocs.org
license=(Apache)
depends=(python)
makedepends=(python-setuptools)
source=(https://github.com/elastic/elasticsearch-dsl-py/archive/$pkgver.tar.gz)
sha512sums=('181b2706e145ab66e7d0362f09598997126fa5480f98e9991f48b1c6aa35fa6a3edbf7028a14e81bc1a678eee25257975bc1e197b06a4a1b8712a3fd6d8ca130')

package() {
  cd ${pkgname/python-/}-py-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
