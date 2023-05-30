# Contributor: Patrick Mischke

pkgname='python-ibmcloudant'
_name='ibmcloudant'
pkgver=0.4.2
pkgrel=1
pkgdesc="Python Library for Cloudant and CouchDB Access. Successor of python-cloudant"
url="https://github.com/IBM/cloudant-python-sdk"
depends=('python-ibm-cloud-sdk-core')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://github.com/IBM/cloudant-python-sdk/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('414328e9d07f86f09b2fd72e0d38ce96351fe68c644c67545e9efc59d4975c37')

build() {
  cd "cloudant-python-sdk-$pkgver"
  python setup.py build
}

package() {
  cd "cloudant-python-sdk-$pkgver"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
