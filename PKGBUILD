# Maintainer: Ghabry <gabriel-aur mastergk de>

pkgname=minimap2
pkgver=2.26
pkgrel=1
pkgdesc="A versatile pairwise aligner for genomic and spliced nucleotide sequences"
arch=('i686' 'x86_64')
url="https://lh3.github.io/minimap2"
license=('MIT')
depends=('zlib')
source=("https://github.com/lh3/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('6a588efbd273bff4f4808d5190957c50272833d2daeb4407ccf4c1b78143624c')

prepare() {
  cd $pkgname-$pkgver
}

build() {
  cd $pkgname-$pkgver

  make
}

package() {
  cd $pkgname-$pkgver

  # application
  install -Dm0755 $pkgname "$pkgdir"/usr/bin/$pkgname

  # license
  install -Dm0644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
