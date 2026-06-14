# Maintainer: Standa Lukeš <archpkg@exyi.cz>

pkgname='trimal'
pkgver=1.5.1
pkgdesc="A tool for automated alignment trimming in large-scale phylogenetic analyses"
pkgrel=1
arch=('x86_64')
url='https://github.com/inab/trimal'
license=('GPL')
makedepends=('make' 'gcc')
source=("${pkgname}-${pkgver}.tgz::https://github.com/inab/trimal/archive/v${pkgver}.tar.gz")
sha256sums=('58751054861b152e92214ff8c01a132071230614e8e777a7c9280d03648cde3b')

build() {
  cd "$srcdir/$pkgname-$pkgver/source"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "source/trimal" "$pkgdir/usr/bin/trimal"
  install -Dm755 "source/readal" "$pkgdir/usr/bin/readal"
}
