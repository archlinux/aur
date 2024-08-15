# Maintainer: Standa Lukeš <archpkg@exyi.cz>

pkgname='trimal'
pkgver=1.5.0
pkgdesc="A tool for automated alignment trimming in large-scale phylogenetic analyses"
pkgrel=1
arch=('x86_64')
url='https://github.com/inab/trimal'
license=('GPL')
makedepends=('make' 'gcc')
source=("${pkgname}-${pkgver}.tgz::https://github.com/inab/trimal/archive/v${pkgver}.tar.gz")
sha256sums=('3fba2e07bffb7290c34e713a052d0f0ff1ce0792861740a8cec46f40685c6d73')

build() {
  cd "$srcdir/$pkgname-$pkgver/source"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "source/trimal" "$pkgdir/usr/bin/trimal"
  install -Dm755 "source/readal" "$pkgdir/usr/bin/readal"
}
