# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=bowtie2-bin
pkgver=2.5.2
pkgrel=1
pkgdesc="Tool for aligning sequencing reads to long reference sequences"
arch=('x86_64' 'aarch64')
url="https://bowtie-bio.sourceforge.net/bowtie2/index.shtml"
license=('GPL')
depends=('gcc-libs' 'perl')
optdepends=('python')
provides=("bowtie2=$pkgver")
conflicts=('bowtie2')
source_x86_64=("https://github.com/BenLangmead/bowtie2/releases/download/v$pkgver/bowtie2-$pkgver-linux-x86_64.zip")
source_aarch64=("https://github.com/BenLangmead/bowtie2/releases/download/v$pkgver/bowtie2-$pkgver-linux-aarch64.zip")
sha256sums_x86_64=('82718f914a6bbe0bdb56e1db36755543010224add735e9ffede8a07c3be3c6da')
sha256sums_aarch64=('8a62ed87ae30dcac901e48b98205624f84d7eb66a6780aeb77bab4a24da5e02a')


package() {
  cd "bowtie2-$pkgver-linux-$CARCH"

  install -Dm755 bowtie2{,-*} -t "$pkgdir/usr/bin"
  rm "$pkgdir/usr/bin"/*-debug

  install -Dm644 {MANUAL,MANUAL.markdown,TUTORIAL} -t "$pkgdir/usr/share/doc/bowtie2"
  install -Dm644 "doc"/* -t "$pkgdir/usr/share/doc/bowtie2/doc"
}
