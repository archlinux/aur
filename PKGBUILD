# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-chameleon
pkgname=('python-chameleon' 'python2-chameleon')
pkgver=3.6
pkgrel=1
pkgdesc="Fast HTML/XML Template Compiler"
arch=('any')
license=('custom:BSD' 'ZPL')
url="http://www.pagetemplates.org/"
makedepends=('python-setuptools' 'python2-setuptools')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/malthe/chameleon/archive/$pkgver.tar.gz")
sha512sums=('4afb8a60b46dc64dc4214a16586b6431e5fe7e52cfa5ede5cebe38357d3005b4cfc7ea02e68a31e83ebd08f700c08e34ea3c6808614a7d596d3e25cf10f09c87')

build() {
  cd chameleon-$pkgver
  python setup.py build
  python2 setup.py build
}

check() {
  cd chameleon-$pkgver
  python setup.py test
  python2 setup.py test
}

package_python-chameleon() {
  depends=('python')

  cd chameleon-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}

package_python2-chameleon() {
  depends=('python2')

  cd chameleon-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
