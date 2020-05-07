# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-google-cloud-storage
pkgver=1.28.1
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
sha256sums=('ee89275cd526aaa799a86eccc6e8a403084b12e0e1adb71021d0825d085dfc0c')

_pkgname=python-storage

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
