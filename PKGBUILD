# Maintainer: Guoyi Zhang <myname at malacology dot net>
# Contributor: Roberto Rossini ("robymetallo") <roberto.rossini.9533@student.uu.se>

pkgname=stringtie
pkgver=3.0.2
pkgrel=1
pkgdesc="A fast and highly efficient assembler of RNA-Seq\
 alignments into potential transcripts"

url='https://ccb.jhu.edu/software/stringtie/index.shtml'
arch=('x86_64')

license=('MIT')
makedepends=('gcc' 'make' 'git')
depends=('gcc-libs' 'zlib')

source=("http://ccb.jhu.edu/software/$pkgname/dl/$pkgname-$pkgver.tar.gz")
sha256sums=('c2d600eac61243b266a116370f4c48a7445616f7ca06511cf42dae0eed6638d7')

build() {
  cd $pkgname-$pkgver/
  
  make release
}

check() {
  cd $pkgname-$pkgver/
  make test
}

package() {
  cd $pkgname-$pkgver/

  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
