# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=python-elasticsearch-dsl
pkgver=6.2.1
pkgrel=1
pkgdesc='High-level Python client for Elasticsearch'
arch=(any)
url=https://elasticsearch-dsl.readthedocs.org
license=(Apache)
depends=(python)
makedepends=(python-setuptools)
source=(https://github.com/elastic/elasticsearch-dsl-py/archive/$pkgver.tar.gz)
sha512sums=('0a0da6592af10926d2b537f5c45188cab171b6c14b38e001b8df8967ad309b949a843f7775aec431621f08e97b28ca1eca5bf09875c8659901b676d549711fd8')

package() {
  cd ${pkgname/python-/}-py-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm 644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
