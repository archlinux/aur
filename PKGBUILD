# Maintainer: Maël Kerbiriou <m431.kerbiriou@gmail.com>
# Previous maintainer: Alex Peltzer ("alexpe87") <alexpe.aur@mailbox.org>
# Contributor: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=bwa
pkgver=0.7.18
pkgrel=1
pkgdesc="Burrows-Wheeler Aligner maps low-divergent sequences against a large reference genome"
arch=('i686' 'x86_64' 'aarch64')
url="http://bio-bwa.sourceforge.net/"
license=('GPL-3.0-only')
depends=('perl' 'zlib' 'glibc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lh3/bwa/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('194788087f7b9a77c0114aa481b2ef21439f6abab72488c83917302e8d0e7870')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 bwa          "$pkgdir/usr/bin/bwa"
  install -Dm755 qualfa2fq.pl "$pkgdir/usr/bin/qualfa2fq"
  install -Dm755 xa2multi.pl  "$pkgdir/usr/bin/xa2multi"
  install -Dm644 bwa.1        "$pkgdir/usr/share/man/man1/bwa.1"
  install -Dm644 COPYING      "$pkgdir/usr/share/licenses/${pkgname}"
}
