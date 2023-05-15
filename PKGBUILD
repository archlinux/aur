# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-prometheus-flask-exporter
pkgver=0.22.4
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
sha256sums=('43dda2ab476287c99583dfc5ab0f1f7cd7b77558aa5abc8eda4caf027d4d34fa')

_pkgname=prometheus_flask_exporter

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
