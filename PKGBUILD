# Maintainer: Frederic Van Assche <frederic@fredericva.com>

pkgname=python-influxdb-client
pkgver=1.22.0
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
sha512sums=('4e744ffabb6e39c53d8522b1a1b2a96ce19853feb30ceffe509be0d404bf78f0e41f38c9f12130e0c0a022ca6010206e11633782d781e78acf13cb55920d3224')

build() {
  cd "$srcdir/influxdb-client-python-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/influxdb-client-python-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
