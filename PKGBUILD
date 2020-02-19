# Maintainer: Jeff Henson <jeff@henson.io>
# Old Maintainer: Giacomo Longo <gabibbo97@gmail.com>
pkgname=python-openshift
pkgver=0.10.2
pkgrel=1
pkgdesc="Python client for the OpenShift API"
url="https://github.com/openshift/openshift-restclient-python"
license=('APACHE')
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('10868c5697c7610e1d18d62118f1bf2096d35789fa9790c89285947a93545a8a')
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
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
