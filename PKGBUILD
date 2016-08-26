# Maintainer: Piotr Rogoza <piotr dot r dot public at gmail dot com>
# Contributor: Piotr Rogoza <piotr dot r dot public at gmail dot com>

pkgname=tkdnd
pkgver=2.8
pkgrel=1
pkgdesc="add native drag'n'drop capabilities to tk"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/tkdnd/"
license=("GPL")
depends=('tk')
conflicts=(tkdnd-cvs)
options=(!emptydirs)
source=("http://sourceforge.net/projects/tkdnd/files/TkDND/TkDND%20${pkgver}/tkdnd${pkgver}-src.tar.gz")
sha256sums=('5e76266adaf381f0c6797b2a15a77c162c2fe718f887d973d61316ded802ca78')

build() {
  cd "$srcdir/$pkgname$pkgver"
  ./configure --prefix=/usr
  make
}
package(){
  cd "$srcdir/$pkgname$pkgver"
  make DESTDIR="$pkgdir/" install
}
