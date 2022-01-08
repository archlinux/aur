# Maintainer: Oskar Roesler <oskar at oskar-roesler dot de>

pkgname=python2-ply
pkgver=3.11
pkgrel=1
pkgdesc='Implementation of lex and yacc parsing tools'
arch=('any')
url='https://www.dabeaz.com/ply/'
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://pypi.io/packages/source/p/ply/ply-$pkgver.tar.gz")
sha512sums=('37e39a4f930874933223be58a3da7f259e155b75135f1edd47069b3b40e5e96af883ebf1c8a1bbd32f914a9e92cfc12e29fec05cf61b518f46c1d37421b20008')

check() {
  cd "ply-$pkgver/test"
  python2 testlex.py
  python2 testyacc.py
}

package() {
  cd "ply-$pkgver"
  python2 setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
