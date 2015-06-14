# Maintainer: Piotr Rogoza <piotr dot r dot public at gmail dot com>
# Contributor: Piotr Rogoza <piotr dot r dot public at gmail dot com>

pkgname=tkdnd
pkgver=2.7
pkgrel=1
pkgdesc="add native drag'n'drop capabilities to tk"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/tkdnd/"
license="GPL"
depends=('tk')
conflicts=(tkdnd-cvs)
options=(!emptydirs)
source=("http://sourceforge.net/projects/tkdnd/files/TkDND/TkDND%20${pkgver}/tkdnd${pkgver}-src.tar.gz")
sha256sums=('d81a782bf743d2f7382c3ef27d8e1af05de0cc45d4fb6767fabf2f85741c8abd')

build() {
  cd "$srcdir/$pkgname$pkgver"
  ./configure --prefix=/usr
  make
}
package(){
  cd "$srcdir/$pkgname$pkgver"
  make DESTDIR="$pkgdir/" install
}
