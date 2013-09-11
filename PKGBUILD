# Contributor: Zerial <fernando@zerial.org>
pkgname=waimea
pkgver=0.4.0
pkgrel=4
pkgdesc="A fast and highly customizable virtual multiple desktop window manager."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/waimea"
license=('GPL')
depends=('imlib2' 'libxft' 'libxrandr' 'libxinerama' 'perl')
install=
source=(http://downloads.sourceforge.net/sourceforge/waimea/$pkgname-$pkgver.tar.bz2)
noextract=()
md5sums=('0ce2ce92451e4e757a75c958b6acb87a')

build() {
  cd $pkgname-$pkgver
  CXXFLAGS="$CXXFLAGS -fpermissive" \
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}
package() {
  cd $pkgname-$pkgver
  make prefix="$pkgdir/usr" mandir="$pkgdir/usr/share/man" install
}
