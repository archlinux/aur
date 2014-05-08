# Contributor: Zerial <fernando@zerial.org>
pkgname=waimea
pkgver=0.4.0
pkgrel=6
pkgdesc="A fast and highly customizable virtual multiple desktop window manager."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/waimea"
license=('GPL')
depends=('imlib2' 'libxft' 'libxrandr' 'libxinerama' 'perl')
install=
source=("http://downloads.sourceforge.net/sourceforge/waimea/$pkgname-$pkgver.tar.bz2"
	"$pkgname.patch")
noextract=()
md5sums=('0ce2ce92451e4e757a75c958b6acb87a')

prepare() {
  cd $pkgname-$pkgver
  patch -Np2 -b -z .orig -i ../$pkgname.patch
}
build() {
  cd $pkgname-$pkgver
  autoreconf -fiv
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}
package() {
  cd $pkgname-$pkgver
  make prefix="$pkgdir/usr" mandir="$pkgdir/usr/share/man" install
}
md5sums=('0ce2ce92451e4e757a75c958b6acb87a'
         '61f5c6bbc47a3e84a9fd8ae76c3e0fbc')
md5sums=('0ce2ce92451e4e757a75c958b6acb87a'
         'a1aae5e6f1d7eec937ffbaf4d723d373')
md5sums=('0ce2ce92451e4e757a75c958b6acb87a'
         'e2a11deb21f3c95edd3dca2bef1148c1')
