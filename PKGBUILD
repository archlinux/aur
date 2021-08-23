# Contributor: Patrick Mischke

pkgname='python-ibmcloudant'
_name='ibmcloudant'
pkgver=0.0.35
pkgrel=1
pkgdesc="Python Library for Cloudant and CouchDB Access"
url="https://github.com/IBM/cloudant-python-sdk"
depends=('python-requests' 'python-dateutil' 'python-websocket-client' 'python-jproperties' 'python-ibm-cloud-sdk-core')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('95a4d08433e787371e560297977155320b8217b2e971043b98bff67a7415c251')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
