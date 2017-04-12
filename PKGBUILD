# Maintainer: Nils Czernia <nils[at]czserver.de>
# Based on AUR packet python2-prometheus_client by Pavel Borzenkov

pkgname=python-prometheus_client
_pkgname=client_python
pkgver=0.0.19
pkgrel=1
pkgdesc="Prometheus instrumentation library for Python 3 applications"
url="https://github.com/prometheus/client_python"
arch=('any')
license=('APACHE')
depends=('python')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/prometheus/client_python/archive/${pkgver}.tar.gz)
sha512sums=('0ee5d95c27f7be5f88d462d8a851f6072af49421788c6b3e9f4f51aa5dd1ecd9324539405c1873a3becd62c0cb03bd540c0c29d8fd2115e865bf53189740b0da')

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --skip-build -O1 --root="${pkgdir}"
}

# vim: ts=2 sw=2 et:
