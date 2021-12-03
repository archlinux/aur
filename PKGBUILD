# Contributor: Patrick Mischke

pkgname='python-ibmcloudant'
_name='ibmcloudant'
pkgver=0.0.41
pkgrel=1
pkgdesc="Python Library for Cloudant and CouchDB Access. Successor of python-cloudant"
url="https://github.com/IBM/cloudant-python-sdk"
depends=('python-ibm-cloud-sdk-core')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('4bcdc695a4e3138c44d487ecb2884c184323ad3e45f887d4d27363243ce80141')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
