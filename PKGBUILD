# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-google-cloud-storage
pkgver=1.29.0
pkgrel=1
pkgdesc='Google Cloud Storage API client library'
arch=('any')
url='https://github.com/googleapis/python-storage'
license=('Apache-2.0')
depends=('python' 'python-google-auth' 'python-google-cloud-core'
         'python-google-resumable-media' 'python-protobuf'
         'python-google-api-core')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver::https://github.com/googleapis/python-storage/archive/v$pkgver.tar.gz")
sha256sums=('a77e820b370a3d5c6e6280ed13d49be210a82985a3d597d149891b23a07fd12b')

_pkgname=python-storage

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
