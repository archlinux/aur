# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Frank Siegert <frank.siegert@googlemail.com>

pkgname=fastjet
pkgver=3.4.1
pkgrel=1
pkgdesc="A particle physics package for jet finding in pp and e+e- collisions."
arch=('x86_64')
url="http://fastjet.fr"
license=('GPL2')
depends=('bash')
makedepends=('gcc-fortran' 'python')
source=("http://fastjet.fr/repo/$pkgname-$pkgver.tar.gz")
sha512sums=('4af2b85037218365ed9cccc1fbe6040abbef90238bc28ca50dbc3f9613ae6e9bac351794b6080160519ede708403c012d7c9f3a9c619032a20d84627f68f38aa')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --enable-allplugins --enable-static=no --enable-pyext
  make
}

check() {
  cd $pkgname-$pkgver
  make -k check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}
