# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=bwa
pkgver=0.7.12
pkgrel=1
pkgdesc="Burrows-Wheeler Aligner maps low-divergent sequences against a large reference genome"
arch=('i686' 'x86_64')
url="http://bio-bwa.sourceforge.net/"
license=('GPL3')
depends=('perl' 'zlib')
source=(http://downloads.sourceforge.net/bio-bwa/$pkgver/$pkgname-$pkgver.tar.bz2)
md5sums=('075704634146ec8cc7543c0dee8960e7')

build() {
  cd $srcdir/$pkgname-$pkgver

  make
}

package() {
  cd $srcdir/$pkgname-$pkgver

  install -Dm755 bwa          $pkgdir/usr/bin/bwa
  install -Dm755 qualfa2fq.pl $pkgdir/usr/bin/qualfa2fq
  install -Dm755 xa2multi.pl  $pkgdir/usr/bin/xa2multi
  install -Dm644 bwa.1        $pkgdir/usr/share/man/man1/bwa.1
}
