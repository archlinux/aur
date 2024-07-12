# Contributor: Patrick Mischke
pkgname='python-ibmcloudant'
_name='ibmcloudant'
pkgver=0.9.1
pkgrel=1
pkgdesc="Python Library for Cloudant and CouchDB Access. Successor of python-cloudant"
url="https://github.com/IBM/cloudant-python-sdk"
depends=('python-ibm-cloud-sdk-core' 'python-requests' 'python-dateutil' 'python-pyjwt' 'python' 'python-build')
makedepends=('python-setuptools' 'python-flit' 'python-installer')
license=('Apache-2.0')
arch=('any')
source=("https://github.com/IBM/cloudant-python-sdk/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3e5c7ef64adcef93753ab65a978160b0baca36bcca74fd56c617b317cef8d33c')

build() {
  cd "cloudant-python-sdk-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "cloudant-python-sdk-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl 
}
