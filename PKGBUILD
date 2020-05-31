# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-chameleon
pkgver=3.7.2
pkgrel=1
pkgdesc="Fast HTML/XML Template Compiler"
arch=('any')
license=('custom:BSD' 'ZPL')
url="http://www.pagetemplates.org/"
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/malthe/chameleon/archive/$pkgver.tar.gz")
sha512sums=('3025fa92bdff3279fc404ad08d73d46bee82afd421f1d81982bd5cd2ea3fdffadf22efdb8b66157dbdf4d0cd793ac06b1a0daac4eb17a2a1ce9f14a65d4a6f8d')

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
