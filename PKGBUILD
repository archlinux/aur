# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-libusb-package
pkgver=1.0.26.2
pkgrel=1
pkgdesc='Packaged libusb shared libraries for Python.'
arch=('x86_64')
url='https://github.com/pyocd/libusb-package'
license=('Apache-2.0')
depends=('python' 'libusb')
makedepends=('python-build' 'python-installer' 'python-wheel'
             'python-setuptools' 'python-setuptools-scm' 'libusb')
source=("$pkgname-$pkgver::https://github.com/pyocd/libusb-package/archive/v$pkgver.tar.gz")
sha256sums=('00060efe95fd9034b3fe1e959269e5c45be0324e459ef1c7171229bde66223c4')

_pkgname=libusb-package

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
