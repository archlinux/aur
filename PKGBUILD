# Maintainer: Jeff Henson <jeff@henson.io>
# Old Maintainer: Giacomo Longo <gabibbo97@gmail.com>

pkgname=python-openshift
pkgver=0.12.0
pkgrel=1
pkgdesc="Python client for the OpenShift API"
url="https://github.com/openshift/openshift-restclient-python"
license=('APACHE')
source=("https://github.com/openshift/openshift-restclient-python/archive/v${pkgver}.tar.gz")
sha256sums=('6de497dd9b3ceb17abfec6074bc5758e1901088d41bd923c4f7b2ece29a7d15c')
arch=('any')
makedepends=('python-setuptools')
depends=(
  'python'
  'python-jinja'
  'python-kubernetes'
  'python-string-utils'
  'python-ruamel-yaml'
  'python-six'
)

build() {
  cd openshift-restclient-python-${pkgver}
  python setup.py build
}

package() {
  cd openshift-restclient-python-${pkgver}
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
