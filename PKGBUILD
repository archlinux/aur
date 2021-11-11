# Contributor: Patrick Mischke

pkgname='python-ibmcloudant'
_name='ibmcloudant'
pkgver=0.0.39
pkgrel=1
pkgdesc="Python Library for Cloudant and CouchDB Access. Successor of python-cloudant"
url="https://github.com/IBM/cloudant-python-sdk"
depends=('python-ibm-cloud-sdk-core')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('7e5b6fb2af6bd5ee8f297c8c053d9d39c923513aefac5a4ddcb8177a2a3d569a')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
