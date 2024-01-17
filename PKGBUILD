# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=bowtie2-bin
pkgver=2.5.3
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
sha256sums_x86_64=('8ecf32a895fcdbbc41a3aef5f0c4affa2266dcb63c82291e9b1280e9326739f4')
sha256sums_aarch64=('ed7db90033a1eb3b89d20bba21b57cd258effceef9e76da9b1f2e7957b2649c1')


package() {
  cd "bowtie2-$pkgver-linux-$CARCH"

  install -Dm755 bowtie2{,-*} -t "$pkgdir/usr/bin"
  rm "$pkgdir/usr/bin"/*-debug

  install -Dm644 {MANUAL,MANUAL.markdown,TUTORIAL} -t "$pkgdir/usr/share/doc/bowtie2"
  install -Dm644 "doc"/* -t "$pkgdir/usr/share/doc/bowtie2/doc"
}
