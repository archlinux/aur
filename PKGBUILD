# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=bowtie2-bin
pkgver=2.5.4
pkgrel=1
pkgdesc="Tool for aligning sequencing reads to long reference sequences"
arch=('x86_64' 'aarch64')
url="https://bowtie-bio.sourceforge.net/bowtie2/index.shtml"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'perl')
optdepends=('python')
provides=("bowtie2=$pkgver")
conflicts=('bowtie2')
source_x86_64=("https://github.com/BenLangmead/bowtie2/releases/download/v$pkgver/bowtie2-$pkgver-linux-x86_64.zip")
source_aarch64=("https://github.com/BenLangmead/bowtie2/releases/download/v$pkgver/bowtie2-$pkgver-linux-aarch64.zip")
sha256sums_x86_64=('32de7d9363124452296d45d7cb7da48d41c60e9ebaeebd2feafe1cc0418ae00c')
sha256sums_aarch64=('2f1c45aa9d46943a8c9abb8c24b22c2178b20073a9ccdacbe6ecc8368a466e41')


package() {
  cd "bowtie2-$pkgver-linux-$CARCH"

  install -Dm755 bowtie2{,-*} -t "$pkgdir/usr/bin"
  rm "$pkgdir/usr/bin"/*-debug

  install -Dm644 {MANUAL,MANUAL.markdown,TUTORIAL} -t "$pkgdir/usr/share/doc/bowtie2"
  install -Dm644 "doc"/* -t "$pkgdir/usr/share/doc/bowtie2/doc"
}
