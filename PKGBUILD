# Contributor: Patrick Mischke

pkgname='python-ibmcloudant'
_name='ibmcloudant'
pkgver=0.0.36
pkgrel=1
pkgdesc="Python Library for Cloudant and CouchDB Access"
url="https://github.com/IBM/cloudant-python-sdk"
depends=('python-requests' 'python-dateutil' 'python-websocket-client' 'python-jproperties' 'python-ibm-cloud-sdk-core')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('2e981b8960d7d1899736b82dabf7a90ca99e2a6d64ea560358271376bd3f2af0')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
