# Contributor: Patrick Mischke

pkgname='python-ibmcloudant'
_name='ibmcloudant'
pkgver=0.2.1
pkgrel=1
pkgdesc="Python Library for Cloudant and CouchDB Access. Successor of python-cloudant"
url="https://github.com/IBM/cloudant-python-sdk"
depends=('python-ibm-cloud-sdk-core')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://github.com/IBM/cloudant-python-sdk/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b5ab2c3ac5d47bcd6065e7943d0bc4de8397586fa4b61e0b1cb20b5a73f92c49')

build() {
  cd "cloudant-python-sdk-$pkgver"
  python setup.py build
}

package() {
  cd "cloudant-python-sdk-$pkgver"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
