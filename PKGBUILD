# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Frank Siegert <frank.siegert@googlemail.com>

pkgname=fastjet
pkgver=3.4.2
pkgrel=2
pkgdesc="A particle physics package for jet finding in pp and e+e- collisions."
arch=('x86_64')
url="http://fastjet.fr"
license=('GPL2')
depends=('bash')
makedepends=('gcc-fortran' 'python')
source=("http://fastjet.fr/repo/$pkgname-$pkgver.tar.gz")
sha512sums=('e7702699e67ba5af73f1fe931fe5f67b9f52bb2f0cfdc57dbacf408741e6271ed160503fe6142c92621287df49b441ce7562af589353b199fed09a4c4c839f3f')

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
