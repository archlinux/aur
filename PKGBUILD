# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-libusb-package
pkgver=1.0.25.0
pkgrel=1
pkgdesc='Packaged libusb shared libraries for Python.'
arch=('x86_64')
url='https://github.com/pyocd/libusb-package'
license=('Apache-2.0')
depends=('python' 'libusb')
makedepends=('python' 'python-setuptools-scm' 'libusb')
source=("$pkgname-$pkgver::https://github.com/pyocd/libusb-package/archive/v$pkgver.tar.gz")
sha256sums=('d70bd5832b033e462b2cd938db940c69ae9dbe604d48bc8831bbfb6d641b9c05')

_pkgname=libusb-package

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
