# Maintainer: Jeff Henson <jeff@henson.io>
# Old Maintainer: Giacomo Longo <gabibbo97@gmail.com>

pkgname=python-openshift
pkgver=0.11.2
pkgrel=1
pkgdesc="Python client for the OpenShift API"
url="https://github.com/openshift/openshift-restclient-python"
license=('APACHE')
source=("https://github.com/openshift/openshift-restclient-python/archive/v${pkgver}.tar.gz")
sha256sums=('c2ba45bac6068dbeacf40986659c4adfb5d249d879e767b1865ddecc65e710d3')
arch=('any')
makedepends=('python-setuptools')
depends=(
  'python'
  'python-dictdiffer'
  'python-jinja'
  'python-kubernetes>=11'
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
