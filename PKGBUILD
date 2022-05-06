# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=hisat2-bin
pkgver=2.2.1
pkgrel=3
pkgdesc="A fast and sensitive alignment program for mapping sequencing reads"
arch=('x86_64')
url="https://daehwankimlab.github.io/hisat2/"
license=('GPL')
depends=('glibc')
optdepends=('perl' 'python')
provides=("hisat2=$pkgver")
conflicts=('hisat2')
source_x86_64=("https://cloud.biohpc.swmed.edu/index.php/s/oTtGWbWjaxsQ2Ho/download")
sha256sums_x86_64=('ae53af930729787a126944f7db34d4065c06f589c4fb05f4cfa9a348cacd5cb4')


package() {
  cd "hisat2-$pkgver"

  install -Dm755 hisat2{,-*} -t "$pkgdir/usr/bin"
  rm "$pkgdir/usr/bin"/*-debug

  install -Dm644 {MANUAL.markdown,TUTORIAL} -t "$pkgdir/usr/share/doc/hisat2"
}
