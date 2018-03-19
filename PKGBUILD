# Maintainer: Nils Czernia <nils[at]czserver.de>
# Based on AUR packet python2-prometheus_client by Pavel Borzenkov

pkgname=python-prometheus_client
_pkgname=client_python
pkgver=0.1.1
pkgrel=1
pkgdesc="Prometheus instrumentation library for Python 3 applications"
url="https://github.com/prometheus/client_python"
arch=('any')
license=('APACHE')
depends=('python')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/prometheus/client_python/archive/v${pkgver}.tar.gz)
sha512sums=('ac343f416dc4f9907e4da0de19d2005375102fb552491025d76466dee1fb1be753a8e20380c83276116a1606a32a9373db53e8a2952669d511255438d74ba217')

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --skip-build -O1 --root="${pkgdir}"
}

# vim: ts=2 sw=2 et:
