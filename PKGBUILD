# Maintainer: Jeff Henson <jeff@henson.io>
# Old Maintainer: Giacomo Longo <gabibbo97@gmail.com>

pkgname=python-openshift
pkgver=0.10.3
pkgrel=1
pkgdesc="Python client for the OpenShift API"
url="https://github.com/openshift/openshift-restclient-python"
license=('APACHE')
source=("https://github.com/openshift/openshift-restclient-python/archive/v${pkgver}.tar.gz")
sha256sums=('05da5b323e1be23d6cf6f1e4eadd984021e023d5330262f79e963b500b407112')
arch=('any')
makedepends=('python-setuptools')
depends=(
  'python'
  'python-dictdiffer'
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
