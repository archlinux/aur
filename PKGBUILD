# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=bwa
pkgver=0.7.16
_pkgver=${pkgver}a
pkgrel=1
pkgdesc="Burrows-Wheeler Aligner maps low-divergent sequences against a large reference genome"
arch=('i686' 'x86_64')
url="http://bio-bwa.sourceforge.net/"
license=('GPL3')
depends=('perl' 'zlib')
source=(https://github.com/lh3/bwa/releases/download/v$pkgver/bwa-${_pkgver}.tar.bz2)
md5sums=('c5115c9a5ea0406848500e4b23a7708c')

build() {
  cd $srcdir/$pkgname-$_pkgver

  make
}

package() {
  cd $srcdir/$pkgname-$_pkgver

  install -Dm755 bwa          $pkgdir/usr/bin/bwa
  install -Dm755 qualfa2fq.pl $pkgdir/usr/bin/qualfa2fq
  install -Dm755 xa2multi.pl  $pkgdir/usr/bin/xa2multi
  install -Dm644 bwa.1        $pkgdir/usr/share/man/man1/bwa.1
}
