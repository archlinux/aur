# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-chameleon
pkgver=3.7.0
pkgrel=1
pkgdesc="Fast HTML/XML Template Compiler"
arch=('any')
license=('custom:BSD' 'ZPL')
url="http://www.pagetemplates.org/"
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/malthe/chameleon/archive/$pkgver.tar.gz")
sha512sums=('9f1d2a9222b795ac139f0c06ea8169ec132c00714ec4608e58dd5781dba8380f988141f6659c47e8920ee0cd4d4bcde9070794cd0e2b5f34d0fce21d24e2dc98')

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
