# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>

pkgname=python-libnacl
pkgver=1.7.1
pkgrel=2
pkgdesc='A simple ctypes based python binding to libsodium'
arch=('any')
url='https://libnacl.readthedocs.org'
license=('Apache')
depends=('python' 'libsodium')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/saltstack/libnacl/archive/v$pkgver.tar.gz")
sha512sums=('4beb6a5f30688ea72836512f771c566f2c0c03bbdeade4f4135b3068945a3b3e0da826f97a78f495887e852c36629ddb33e876696263404e74fac11e3b7bc9e9')

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
