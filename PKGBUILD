# Maintainer: James Spencer <james.s.spencer@gmail.com>

pkgname=opium
pkgver=3.8
pkgrel=1
pkgdesc="pseudopotential generator for density functional theory"
arch=('i686' 'x86_64')
url="http://opium.sourceforge.net/"
license=('GPL')
makedepends=('gcc' 'gcc-fortran')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-v$pkgver/$pkgname-v$pkgver-src.tgz)
sha1sums=('9649e79e2393fe35e7575ab31dffd2b1f0437e71')

build() {
  cd "$srcdir/$pkgname-v$pkgver-src"
  ./configure
  sed -i -e 's/-r8//' makevars
  make
}

package() {

  cd "$srcdir/$pkgname-v$pkgver-src"

  install -Dm755 "$srcdir/$pkgname-v$pkgver-src/$pkgname" "$pkgdir/usr/bin/$pkgname"

}
