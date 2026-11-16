# Contributor: Patrick Mischke
pkgname='python-ibmcloudant'
_name='ibmcloudant'
pkgver=0.11.13
pkgrel=1
pkgdesc="Python Library for Cloudant and CouchDB Access. Successor of python-cloudant"
url="https://github.com/IBM/cloudant-python-sdk"
depends=('python-ibm-cloud-sdk-core' 'python-requests' 'python-dateutil' 'python-pyjwt' 'python' 'python-build')
makedepends=('python-setuptools' 'python-flit' 'python-installer')
license=('Apache-2.0')
arch=('any')
source=("https://github.com/IBM/cloudant-python-sdk/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3454efbac1000b78a2409709eeac7ad63bbb77573aee23b7e9135c3c172fb356')

build() {
  cd "cloudant-python-sdk-$pkgver"
#  sed -i 's/flit_core >=3\.9,<4/flit_core >=3.9,<5/' pyproject.toml
  python -m build --wheel --no-isolation
}

package() {
  cd "cloudant-python-sdk-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl 
}
