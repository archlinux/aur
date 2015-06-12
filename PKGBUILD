# $Id: PKGBUILD,v 1.1 2008/08/01 07:04:19 abhidg Exp $
# Maintainer: Abhishek Dasgupta <abhidg@gmail.com>

pkgname=primer3
pkgver=2.3.6
pkgrel=1
pkgdesc="Tool to design flanking oligo nucleotides for DNA amplification"
arch=('i686' 'x86_64')
license=('BSD' 'GPL')
url="http://primer3.sourceforge.net"
source=("http://sourceforge.net/projects/primer3/files/primer3/$pkgver/primer3-src-$pkgver.tar.gz")
md5sums=('6e437ec00f82452b2187da78375f3ed3')

build() {
  cd "$srcdir/$pkgname-$pkgver/src"
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver/src"
  make test
}

package() {
  cd "$srcdir/$pkgname-$pkgver/src"
  for EXEC in long_seq_tm_test ntdpal ntthal oligotm primer3_core; do
      install -Dm755 $EXEC "$pkgdir/usr/bin/$EXEC"
  done
}

