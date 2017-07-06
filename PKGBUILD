# $Id: PKGBUILD 110209 2014-04-26 23:40:24Z dwallace $
# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
pkgname=python2-xenstore
pkgver=0.0.2
pkgrel=4
pkgdesc="Python XenStore Module"
arch=('x86_64' 'i686')
url="https://pypi.python.org/pypi/pyxenstore"
license=('GPL')
depends=('python2' 'xenstore')
makedepends=('python2-distribute')
replaces=('python2-pyxenstore')
provides=('python2-pyxenstore')
source=("https://pypi.python.org/packages/source/p/py${pkgname#*-}/py${pkgname#*-}-$pkgver.tar.gz")
md5sums=('4da2524ed0ec9439afc5c9a46ac21c6c')

build() {
  cd "$srcdir/py${pkgname#*-}-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/py${pkgname#*-}-$pkgver"
  python2 setup.py install --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
