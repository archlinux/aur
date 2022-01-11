# Maintainer: Frederic Van Assche <frederic@fredericva.com>

pkgname=python-influxdb-client
pkgver=1.24.0
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
sha512sums=('dd38eafce38f5af3b2dc0d64c6f23af9ffe4b686d9cf41ca64f3b5e29dd45a5936a25928697ffe71f6fceb165f1e4a6cfd73dbc5ce92dbe29e086167c0cf6225')

build() {
  cd "$srcdir/influxdb-client-python-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/influxdb-client-python-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
