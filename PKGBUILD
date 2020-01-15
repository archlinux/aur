# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-prometheus-flask-exporter
pkgver=0.12.1
pkgrel=1
pkgdesc='Prometheus metrics exporter for Flask'
arch=('x86_64')
url='https://github.com/rycus86/prometheus_flask_exporter'
license=('MIT')
depends=('python' 'python-flask' 'python-prometheus_client')
optdepends=()
makedepends=('python' 'python-setuptools')
source=("$pkgname-$pkgver::https://github.com/rycus86/prometheus_flask_exporter/archive/$pkgver.tar.gz")
sha256sums=('cd05449e110e2ae1c0dad80257b0230fc9748f271d58d19b4b57b86f035d9c26')

_pkgname=prometheus_flask_exporter

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
