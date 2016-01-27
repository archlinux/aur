# Maintainer: Pavel Borzenkov <pavel@voidptr.ru>

pkgname=python2-prometheus_client
_pkgname=client_python
pkgver=0.0.13
pkgrel=1
pkgdesc="Prometheus instrumentation library for Python applications"
url="https://github.com/prometheus/client_python"
arch=('any')
license=('APACHE')
depends=('python2')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/prometheus/client_python/archive/${pkgver}.tar.gz)
sha512sums=('3b4698b140ff9d570e14ed2ac8a5d313d6a9da41413753a64d1dc5f75c2b3f5521ff7d452918d395f648fbd374c951a4ff958cc1866a443f0b2fc03c01aa37d1')

build() {
  cd ${_pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python2 setup.py install --skip-build -O1 --root="${pkgdir}"
}

# vim: ts=2 sw=2 et:
