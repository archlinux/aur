# Contributor: Patrick Mischke

pkgname='python-ibmcloudant'
_name='ibmcloudant'
pkgver=0.5.0
pkgrel=1
pkgdesc="Python Library for Cloudant and CouchDB Access. Successor of python-cloudant"
url="https://github.com/IBM/cloudant-python-sdk"
depends=('python-ibm-cloud-sdk-core')
makedepends=('python-setuptools' 'python-flit')
license=('Apache')
arch=('any')
source=("https://github.com/IBM/cloudant-python-sdk/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('815cc5f8e5fca2ab54bc1850417a31bb83cf732ae610ee4a87c5fb4c816a8443')

build() {
  cd "cloudant-python-sdk-$pkgver"
  python setup.py build
}

package() {
  cd "cloudant-python-sdk-$pkgver"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
