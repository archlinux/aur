# Maintainer: Frederic Van Assche <frederic@fredericva.com>

pkgname=python-influxdb-client
pkgver=1.23.0
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
sha512sums=('4a7a0be23072f80cfc1985d72cf4ac9488d277d02bb0e1d078b082519423fdc97db27f33fe9bfd73ae1b79f80180eb108e7e38af81346af4246490f2e0a86551')

build() {
  cd "$srcdir/influxdb-client-python-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/influxdb-client-python-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
