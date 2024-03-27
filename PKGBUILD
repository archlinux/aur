# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=minimap2-bin
pkgver=2.28
pkgrel=1
pkgdesc="Aligner for genomic and spliced nucleotide sequences"
arch=('x86_64')
url="https://lh3.github.io/minimap2/"
license=('MIT')
depends=('glibc' 'zlib')
provides=("minimap2=$pkgver")
conflicts=('minimap2')
source_x86_64=("https://github.com/lh3/minimap2/releases/download/v$pkgver/minimap2-${pkgver}_x64-linux.tar.bz2")
sha256sums_x86_64=('51f2cf0e486d0f9f88ace1aa58fdc56571382a676ea0889ae607301c60693377')


package() {
  cd "minimap2-${pkgver}_x64-linux"

  install -Dm755 "minimap2" -t "$pkgdir/usr/bin"
  install -Dm644 {cookbook.md,README.md} -t "$pkgdir/usr/share/doc/minimap2"
  install -Dm644 "minimap2.1" -t "$pkgdir/usr/share/man/man1"
  install -Dm644 "LICENSE.txt" -t "$pkgdir/usr/share/licenses/minimap2"
}
