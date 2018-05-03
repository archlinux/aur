# Maintainer: Nils Czernia <nils[at]czserver.de>
# Based on AUR packet python2-prometheus_client by Pavel Borzenkov

pkgname=python-prometheus_client
_pkgname=client_python
pkgver=0.2.0
pkgrel=1
pkgdesc="Prometheus instrumentation library for Python 3 applications"
url="https://github.com/prometheus/client_python"
arch=('any')
license=('APACHE')
depends=('python')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/prometheus/client_python/archive/v${pkgver}.tar.gz)
sha512sums=('7336d8294ef91dfebe91f325a882105cdaf947de212bff651d1c3ebfc139d9045b7f637ea44b18e921a9f2ad9af554aee28587e57b1202b5a30c49b1a765ba4c')

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --skip-build -O1 --root="${pkgdir}"
}

# vim: ts=2 sw=2 et:
