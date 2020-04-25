# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-prometheus-flask-exporter
pkgver=0.13.0
pkgrel=1
pkgdesc='Prometheus metrics exporter for Flask'
arch=('x86_64')
url='https://github.com/rycus86/prometheus_flask_exporter'
license=('MIT')
depends=('python' 'python-flask' 'python-prometheus_client')
optdepends=()
makedepends=('python' 'python-setuptools')
source=("$pkgname-$pkgver::https://github.com/rycus86/prometheus_flask_exporter/archive/$pkgver.tar.gz")
sha256sums=('6fdf97fb623c41830858356eed62e0f50213abf0e2c1f6dbfb7b046769ddafc3')

_pkgname=prometheus_flask_exporter

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
