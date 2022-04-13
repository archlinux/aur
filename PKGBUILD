# Maintainer: Frederic Van Assche <frederic@fredericva.com>

pkgname=python-influxdb-client
pkgver=1.27.0
pkgrel=1
pkgdesc="Python client for InfluxDB 1.8+ and 2.0"
arch=('any')
url="https://github.com/influxdata/influxdb-client-python/"
license=('MIT')
depends=('python' 'python-dateutil' 'python-six' 'python-pytz' 'python-rx' 'python-certifi' 'python-urllib3')
makedepends=('python-setuptools')
optdepends=('influxdb' 'python-ciso8601')
options=(!emptydirs)
source=($pkgname-$pkgver.tar.gz::https://github.com/influxdata/influxdb-client-python/archive/v$pkgver.tar.gz)
sha512sums=('21562ef7763805314059440d631c240b03e613e0edcbbe28e5d6d6bf2cda21555f20cd435ead41bb756c316cbacde43c8cb0667ab7b4b23b176f7a1d7f939d5b')

build() {
  cd "$srcdir/influxdb-client-python-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/influxdb-client-python-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
