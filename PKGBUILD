# Maintainer: Standa Lukeš <archpkg@exyi.cz>

pkgname='trimal'
pkgver=1.4.1
pkgdesc="A tool for automated alignment trimming in large-scale phylogenetic analyses"
pkgrel=1
arch=('x86_64')
url='https://github.com/inab/trimal'
license=('GPL')
makedepends=('make' 'gcc')
source=("${pkgname}-${pkgver}.tgz::https://github.com/inab/trimal/archive/v${pkgver}.tar.gz")
sha256sums=('cb8110ca24433f85c33797b930fa10fe833fa677825103d6e7f81dd7551b9b4e')

build() {
  cd "$srcdir/$pkgname-$pkgver/source"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "source/trimal" "$pkgdir/usr/bin/trimal"
  install -Dm755 "source/readal" "$pkgdir/usr/bin/readal"
}
