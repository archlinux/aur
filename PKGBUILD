# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=hisat2-bin
pkgver=2.2.1
pkgrel=1
pkgdesc="A fast and sensitive alignment program for mapping sequencing reads"
arch=('x86_64')
url="https://daehwankimlab.github.io/hisat2/"
license=('GPL')
depends=('glibc')
optdepends=('perl' 'python')
provides=('hisat2')
conflicts=('hisat2')
source=("https://cloud.biohpc.swmed.edu/index.php/s/4pMgDq4oAF9QCfA/download")
sha256sums=('37a8731bdaecbc378b6cadd1c220641c47f5ff4f00f9d089308706cb47e1b3fa')


package() {
  cd "hisat2-$pkgver"

  install -Dm755 hisat2{,-*} -t "$pkgdir/usr/bin"
  rm "$pkgdir/usr/bin"/*-debug

  install -Dm644 {MANUAL.markdown,TUTORIAL} -t "$pkgdir/usr/share/doc/hisat2"
}
