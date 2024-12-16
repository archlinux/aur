# Maintainer: yjzyl9008@gmail.com
# Contributor: Piotr Rogoza <piotr dot r dot public at gmail dot com>

pkgname=tkdnd
_pkgname=$pkgname-release-test
pkgver=2.9.4
pkgrel=1
pkgdesc="add native drag'n'drop capabilities to Tk toolkit"
arch=(i686 x86_64)
url="https://github.com/petasis/tkdnd"
license=("GPL")
depends=('tk')
conflicts=(tkdnd-cvs tkdnd-git)
options=(!emptydirs)
source=("https://github.com/petasis/tkdnd/archive/tkdnd-release-test-v${pkgver}.tar.gz")
sha256sums=('cc6d3f0b7daca9564869e29e5db0996caa5f0c03d21c9b7032bad43f0a58121c')

build() {
  cd "$srcdir/$pkgname-$_pkgname-v$pkgver"
  ./configure --prefix=/usr
  make
}
package(){
  cd "$srcdir/$pkgname-$_pkgname-v$pkgver"
  make DESTDIR="$pkgdir/" install
}
