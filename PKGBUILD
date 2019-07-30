# Maintainer: Roberto Rossini ("robymetallo") <roberto.rossini.9533@student.uu.se>

pkgname=stringtie
pkgver=2.0
pkgrel=1
pkgdesc="A fast and highly efficient assembler of RNA-Seq\
 alignments into potential transcripts"

url='https://ccb.jhu.edu/software/stringtie/index.shtml'
arch=('x86_64')

license=('Artistic2.0')

depends=('gcc-libs' 'zlib')

source=("https://ccb.jhu.edu/software/$pkgname/dl/$pkgname-$pkgver.tar.gz")
sha256sums=('654da1b85a1eca9ad0d410d0e356ee8f05c62d89d6d4385b07bcd0d03c6b25eb')

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
