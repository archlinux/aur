# Contributor: Patrick Mischke
pkgname='python-ibmcloudant'
_name='ibmcloudant'
pkgver=0.10.5
pkgrel=1
pkgdesc="Python Library for Cloudant and CouchDB Access. Successor of python-cloudant"
url="https://github.com/IBM/cloudant-python-sdk"
depends=('python-ibm-cloud-sdk-core' 'python-requests' 'python-dateutil' 'python-pyjwt' 'python' 'python-build')
makedepends=('python-setuptools' 'python-flit' 'python-installer')
license=('Apache-2.0')
arch=('any')
source=("https://github.com/IBM/cloudant-python-sdk/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e54ec5683b2254c1decbadffba7c2c6e80934b5d8e7f2233e13628e5add11ca6')

build() {
  cd "cloudant-python-sdk-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "cloudant-python-sdk-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl 
}
