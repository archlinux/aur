# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-google-cloud-storage
pkgver=1.31.0
pkgrel=1
pkgdesc='Google Cloud Storage API client library'
arch=('any')
url='https://github.com/googleapis/python-storage'
license=('Apache-2.0')
depends=('python' 'python-google-auth' 'python-google-cloud-core'
         'python-google-resumable-media' 'python-protobuf'
         'python-google-api-core')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/googleapis/python-storage/archive/v$pkgver.tar.gz")
sha256sums=('c392842bd54c4a4e5c656162036d81103c22234752a0f165f70fc13cfd92d63a')

_pkgname=python-storage

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
