# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-google-cloud-storage
pkgver=1.25.0
pkgrel=1
pkgdesc='Google Cloud Storage API client library'
arch=('x86_64')
url='https://github.com/googleapis/google-cloud-python'
license=('Apache-2.0')
depends=('python' 'python-google-auth' 'python-google-cloud-core'
         'python-google-resumable-media')
optdepends=()
makedepends=('python' 'python-setuptools')
source=("$pkgname-$pkgver::https://github.com/googleapis/google-cloud-python/archive/storage-$pkgver.tar.gz")
sha256sums=('3385f1d344b53fb85f53eb0dda480228834f9f0825eca734d3d0961337f0b669')

_pkgname=google-cloud-python-storage

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}/storage"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}/storage"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
