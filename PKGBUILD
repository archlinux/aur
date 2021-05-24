# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=bowtie2-bin
pkgver=2.4.4
pkgrel=1
pkgdesc="Tool for aligning sequencing reads to long reference sequences"
arch=('x86_64' 'aarch64')
url="http://bowtie-bio.sourceforge.net/bowtie2/index.shtml"
license=('GPL')
depends=('glibc')
optdepends=('perl' 'python')
provides=('bowtie2')
conflicts=('bowtie2')
source_x86_64=("https://github.com/BenLangmead/bowtie2/releases/download/v$pkgver/bowtie2-$pkgver-linux-x86_64.zip")
source_aarch64=("https://github.com/BenLangmead/bowtie2/releases/download/v$pkgver/bowtie2-$pkgver-linux-aarch64.zip")
sha256sums_x86_64=('ea1acee531ab67776a349bc152364bee38d36357b9d1ba8d21ae072763765c4c')
sha256sums_aarch64=('44fc32491d7b6ec27333812eef2791c4551ba1ee0c405445d19d05981461eabc')


package() {
  cd "bowtie2-$pkgver-linux-$CARCH"

  install -Dm755 bowtie2{,-*} -t "$pkgdir/usr/bin"
  rm "$pkgdir/usr/bin"/*-debug

  install -Dm644 {MANUAL,MANUAL.markdown,TUTORIAL} -t "$pkgdir/usr/share/doc/bowtie2"
  install -Dm644 "doc"/* -t "$pkgdir/usr/share/doc/bowtie2/doc"
}
