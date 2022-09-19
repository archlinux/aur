# Contributor: Patrick Mischke

pkgname='python-ibmcloudant'
_name='ibmcloudant'
pkgver=0.2.0
pkgrel=1
pkgdesc="Python Library for Cloudant and CouchDB Access. Successor of python-cloudant"
url="https://github.com/IBM/cloudant-python-sdk"
depends=('python-ibm-cloud-sdk-core')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('e3de3d49c1b1b390185c6449052648d03e360b1f0efed7d9a2b6be11f2ce16b4')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
