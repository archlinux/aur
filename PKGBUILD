# Maintainer: Frederic Van Assche <frederic@fredericva.com>

pkgname=python-influxdb-client
pkgver=1.36.1
pkgrel=1
pkgdesc="Python client for InfluxDB 1.8+ and 2.0"
arch=('any')
url="https://github.com/influxdata/influxdb-client-python/"
license=('MIT')
depends=('python>=3.7' 'python-dateutil>=2.5.3' 'python-reactivex>=4.0.4' 'python-certifi>=14.05.14' 'python-urllib3>=1.26.0')
makedepends=('python-setuptools')
optdepends=('influxdb' 'python-ciso8601>=2.1.1')
options=(!emptydirs)
source=($pkgname-$pkgver.tar.gz::https://github.com/influxdata/influxdb-client-python/archive/v$pkgver.tar.gz)
sha512sums=('ef7a16ec0935ac2397fe21fb671758d181939df6c7624a11c505b97de23b366623ef718bdcf6a39ad902e1fe1ef880ac535352dafc636326b9c533b5ec1b4b83')

build() {
  cd "$srcdir/influxdb-client-python-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/influxdb-client-python-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
