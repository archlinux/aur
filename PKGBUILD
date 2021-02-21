# Maintainer: Piotr Rogoza <piotr dot r dot public at gmail dot com>
# Contributor: Piotr Rogoza <piotr dot r dot public at gmail dot com>

pkgname=tkdnd
_pkgname=$pkgname-release-test
pkgver=2.9.2
pkgrel=1
pkgdesc="add native drag'n'drop capabilities to Tk toolkit"
arch=(i686 x86_64)
url="https://github.com/petasis/tkdnd"
license=("GPL")
depends=('tk')
conflicts=(tkdnd-cvs tkdnd-git)
options=(!emptydirs)
source=("https://github.com/petasis/tkdnd/archive/tkdnd-release-test-v${pkgver}.tar.gz")
sha256sums=('456d19115147190601ac22b85e6ce97f9ffc5ab4a7fa1598d5140b5b2e04f57a')

build() {
  cd "$srcdir/$pkgname-$_pkgname-v$pkgver"
  ./configure --prefix=/usr
  make
}
package(){
  cd "$srcdir/$pkgname-$_pkgname-v$pkgver"
  make DESTDIR="$pkgdir/" install
}
