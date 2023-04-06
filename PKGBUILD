# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>

pkgname=python-libnacl
pkgver=1.8.0
pkgrel=4
pkgdesc='A simple ctypes based python binding to libsodium'
arch=('any')
url='https://libnacl.readthedocs.org'
license=('Apache')
depends=('python' 'libsodium')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/l/libnacl/libnacl-$pkgver.tar.gz")
sha512sums=('a57b0a17a27d81c0192edb62d64f9e6a93efd21a580df6721f5bb6e2fb4f23a9dbc448d430428bdcd664e5cec2622e0e4cd5588752e232cdc48842ad5144f848')

build() {
  cd libnacl-$pkgver
  python setup.py build
}

check() {
  cd libnacl-$pkgver
  python -m unittest discover --start-directory tests -v
}

package() {
  cd libnacl-$pkgver
  python setup.py install --root="$pkgdir" -O1
}
