# Maintainer: Guoyi Zhang <myname at malacology dot net>
# Contributor: Roberto Rossini ("robymetallo") <roberto.rossini.9533@student.uu.se>

pkgname=stringtie
pkgver=2.2.2
pkgrel=1
pkgdesc="A fast and highly efficient assembler of RNA-Seq\
 alignments into potential transcripts"

url='https://ccb.jhu.edu/software/stringtie/index.shtml'
arch=('x86_64')

license=('MIT')
makedepends=('gcc' 'make' 'git')
depends=('gcc-libs' 'zlib')

source=("http://ccb.jhu.edu/software/$pkgname/dl/$pkgname-$pkgver.tar.gz")
sha256sums=('f75f23b8466898d27984fb99cf6f828094fb3ed0307aed7af76e334acb997010')

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
