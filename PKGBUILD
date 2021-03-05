# Maintainer: Frederic Van Assche <frederic@fredericva.com>

pkgname=python-influxdb-client
pkgver=1.15.0
pkgrel=1
pkgdesc="Python client for InfluxDB 1.8+ and 2.0"
arch=('any')
url="https://github.com/influxdata/influxdb-client-python/"
license=('MIT')
depends=('python' 'python-dateutil' 'python-six' 'python-pytz' 'python-rx' 'python-certifi' 'python-urllib3')
makedepends=('python-setuptools')
optdepends=('influxdb')
options=(!emptydirs)
source=($pkgname-$pkgver.tar.gz::https://github.com/influxdata/influxdb-client-python/archive/v$pkgver.tar.gz)
sha512sums=('bb27cddb84c40fde88a2cc4be04434258d5edd17707bc4721591a5a886327c5dd2941f89dcfdc924b0fcf701a025fb1737af0e6c3a7560b0315f7615a4065d40')

build() {
  cd "$srcdir/influxdb-client-python-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/influxdb-client-python-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
