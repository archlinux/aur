# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-google-cloud-storage
pkgver=1.36.0
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
sha256sums=('012d12a35703a195de9e17f18854da1c7341b246ef8dd431618e2122e5865067')

_pkgname=python-storage

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
