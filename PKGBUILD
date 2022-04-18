# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-prometheus-flask-exporter
pkgver=0.20.1
pkgrel=1
pkgdesc='Prometheus metrics exporter for Flask'
arch=('x86_64')
url='https://github.com/rycus86/prometheus_flask_exporter'
license=('MIT')
depends=('python' 'python-flask' 'python-prometheus_client')
optdepends=()
makedepends=('python' 'python-setuptools')
source=("$pkgname-$pkgver::https://github.com/rycus86/prometheus_flask_exporter/archive/$pkgver.tar.gz")
sha256sums=('ed8d2bb19d1e709894ea661a46cb6d1a3eee61cc0c1bd48672cf9c25d7199a60')

_pkgname=prometheus_flask_exporter

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
