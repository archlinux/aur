# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-chameleon
pkgver=3.8.1
pkgrel=1
pkgdesc="Fast HTML/XML Template Compiler"
arch=('any')
license=('custom:BSD' 'ZPL')
url="http://www.pagetemplates.org/"
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/malthe/chameleon/archive/$pkgver.tar.gz")
sha512sums=('d4a4b3ac0b59865a7ea1d9ede7f08d991296c1d08a48c7290b9e2864afa6527237d8dee604114918f3b5035f2cc915bf6218d0758ebcd393f2103bb0751f6ea2')

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
