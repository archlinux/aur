# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=bowtie2-bin
pkgver=2.5.5
pkgrel=1
pkgdesc="Tool for aligning sequencing reads to long reference sequences"
arch=('x86_64' 'aarch64')
url="https://bowtie-bio.sourceforge.net/bowtie2/index.shtml"
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc' 'perl')
optdepends=('python')
provides=("bowtie2=$pkgver")
conflicts=('bowtie2')
source_x86_64=("https://github.com/BenLangmead/bowtie2/releases/download/v$pkgver/bowtie2-$pkgver-linux-x86_64.zip")
source_aarch64=("https://github.com/BenLangmead/bowtie2/releases/download/v$pkgver/bowtie2-$pkgver-linux-aarch64.zip")
sha256sums_x86_64=('38472e806f56ed23d32cbe7a7fe1b7260680f892647aa78c2f6882f8f272a026')
sha256sums_aarch64=('d6fd63a46b92308aca32ddcc562f3e7897303ab48656693972a2543bffa07fcc')


package() {
  cd "bowtie2-$pkgver-linux-$CARCH"

  install -Dm755 bowtie2{,-*} -t "$pkgdir/usr/bin"
  rm "$pkgdir/usr/bin"/*-debug

  install -Dm644 {MANUAL,MANUAL.markdown,TUTORIAL} -t "$pkgdir/usr/share/doc/bowtie2"
  install -Dm644 "doc"/* -t "$pkgdir/usr/share/doc/bowtie2/doc"
}
