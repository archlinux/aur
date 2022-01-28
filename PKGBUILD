# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-libusb-package
pkgver=1.0.24.2
pkgrel=1
pkgdesc='Packaged libusb shared libraries for Python.'
arch=('x86_64')
url='https://github.com/pyocd/libusb-package'
license=('Apache-2.0')
depends=('python' 'libusb')
makedepends=('python' 'python-setuptools-scm' 'libusb')
source=("$pkgname-$pkgver::https://github.com/pyocd/libusb-package/archive/v$pkgver.tar.gz")
sha256sums=('3708fbe5ea7a9c71db604ef5d725a4ea0e682ece23ea14b86ebeb2ad732519e4')

_pkgname=libusb-package

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
