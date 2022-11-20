# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-zope-testing
pkgver=4.10
pkgrel=1
pkgdesc="Zope testing helpers"
arch=('any')
url="https://github.com/zopefoundation/zope.testing"
license=('ZPL')
depends=('python38-setuptools' 'python38-zope-interface' 'python38-zope-exceptions')
makedepends=('python38-setuptools' 'python38-zope-interface'
             'python38-zope-exceptions')
checkdepends=('python38-nose')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/zopefoundation/zope.testing/archive/$pkgver.tar.gz")
sha512sums=('ea820a97d675d2ee99662381a568dbbd6c287264a8fcaecb92794fe2dab8c6781fa0564010a162ce6695ce4b666db5e5eefec0aee391d56afe0f5d56446683cf')

build() {
  cd "$srcdir/zope.testing-$pkgver"
  python3.8 setup.py build
}

check() {
  cd "$srcdir/zope.testing-$pkgver"
  python3.8 setup.py test
}

package() {
  cd "$srcdir/zope.testing-$pkgver"
  python3.8 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
