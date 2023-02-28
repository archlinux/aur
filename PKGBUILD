# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-prometheus-flask-exporter
pkgver=0.22.2
pkgrel=1
pkgdesc='Prometheus metrics exporter for Flask'
arch=('x86_64')
url='https://github.com/rycus86/prometheus_flask_exporter'
license=('MIT')
depends=('python' 'python-flask' 'python-prometheus_client')
optdepends=()
makedepends=('python' 'python-build' 'python-installer' 'python-wheel'
             'python-setuptools')
source=("$pkgname-$pkgver::https://github.com/rycus86/prometheus_flask_exporter/archive/$pkgver.tar.gz")
sha256sums=('fbad2842a7147f28ba40f54856fe4abac1f33a2988975c879ae98a3c6b462ef6')

_pkgname=prometheus_flask_exporter

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
