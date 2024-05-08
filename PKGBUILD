# Maintainer: Guoyi Zhang <myname at malacology dot net>
# Contributor: Roberto Rossini ("robymetallo") <roberto.rossini.9533@student.uu.se>

pkgname=stringtie
pkgver=2.2.3
pkgrel=1
pkgdesc="A fast and highly efficient assembler of RNA-Seq\
 alignments into potential transcripts"

url='https://ccb.jhu.edu/software/stringtie/index.shtml'
arch=('x86_64')

license=('MIT')
makedepends=('gcc' 'make' 'git')
depends=('gcc-libs' 'zlib')

source=("http://ccb.jhu.edu/software/$pkgname/dl/$pkgname-$pkgver.tar.gz")
sha256sums=('f372640b70a8fde763712d2f0565aff71f5facdc2300c8af829fea94a05ff208')

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
