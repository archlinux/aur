# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-chameleon
pkgver=3.6.1
pkgrel=1
pkgdesc="Fast HTML/XML Template Compiler"
arch=('any')
license=('custom:BSD' 'ZPL')
url="http://www.pagetemplates.org/"
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/malthe/chameleon/archive/$pkgver.tar.gz")
sha512sums=('ee24ae37604a0e8ad60dce2fb44a0d73a3740d165a98a4103da29770182a9e10a6afb921e1f9f167cd25b9a4202d718d78d8ae8f88e67230d9cdfc75d10223d8')

build() {
  cd chameleon-$pkgver
  python setup.py build
}

check() {
  cd chameleon-$pkgver
  python setup.py test
}

package() {
  cd chameleon-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
