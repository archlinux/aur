# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Frank Siegert <frank.siegert@googlemail.com>

pkgname=fastjet
pkgver=3.5.1
pkgrel=2
pkgdesc="A particle physics package for jet finding in pp and e+e- collisions."
arch=('x86_64')
url="http://fastjet.fr"
license=('GPL2')
depends=('bash')
makedepends=('gcc-fortran' 'python')
source=("http://fastjet.fr/repo/$pkgname-$pkgver.tar.gz")
sha512sums=('b5551eea8f9304e732c169227b0a8a005eb4c44534843e14e2270aef06aad56ba52fb42e5397120615b14f0edc34e825eb547b4e6ac578dcd9806d47e41fa3ca')

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
