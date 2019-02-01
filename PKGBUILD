# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=dostuff
pkgver=12.08.16
pkgrel=1
pkgdesc="A simple ToDo manager"
arch=(any)
url="http://sourceforge.net/projects/pygmed/"
license=('GPL')
depends=('python2' 'dconf' 'libunity')
source=("http://ppa.launchpad.net/ximilian/ppa/ubuntu/pool/main/d/dostuff/dostuff_${pkgver}.tar.gz")
md5sums=('80ccb35cba27137e537bea96b9358f87')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  # python2 fix
  sed -i "s|\(bin/python\).*|\12|" `grep -Erl "bin/python" .`
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
