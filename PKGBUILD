# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-libusb-package
pkgver=1.0.26.0
pkgrel=1
pkgdesc='Packaged libusb shared libraries for Python.'
arch=('x86_64')
url='https://github.com/pyocd/libusb-package'
license=('Apache-2.0')
depends=('python' 'libusb')
makedepends=('python-build' 'python-installer' 'python-wheel'
             'python-setuptools' 'python-setuptools-scm' 'libusb')
source=("$pkgname-$pkgver::https://github.com/pyocd/libusb-package/archive/v$pkgver.tar.gz")
sha256sums=('899dbfb32e964d10c67f1730a8c743e0d4062aa01056eed509eaa14e4d5846c2')

_pkgname=libusb-package

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
