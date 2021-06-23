# Maintainer: Jeff Henson <jeff@henson.io>
# Old Maintainer: Giacomo Longo <gabibbo97@gmail.com>

pkgname=python-openshift
pkgver=0.12.1
pkgrel=1
pkgdesc="Python client for the OpenShift API"
url="https://github.com/openshift/openshift-restclient-python"
license=('APACHE')
source=("https://github.com/openshift/openshift-restclient-python/archive/v${pkgver}.tar.gz")
sha256sums=('eb63a08489798dd5a83c809baabe6a93ed8f82545e8343b53f3e514f6a19c80c')
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
