# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Frank Siegert <frank.siegert@googlemail.com>

pkgname=fastjet
pkgver=3.3.2
pkgrel=2
pkgdesc="A particle physics package for jet finding in pp and e+e- collisions."
arch=('x86_64')
url="http://fastjet.fr"
license=('GPL2')
depends=('bash')
makedepends=('gcc-fortran' 'python')
source=("http://fastjet.fr/repo/$pkgname-$pkgver.tar.gz")
md5sums=('ca3708785c9194513717a54c1087bfb0')

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
