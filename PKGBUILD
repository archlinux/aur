# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: juan pablo gonzalez <lord_jotape@yahoo.com.ar> #Thanks to keenerd and ivo
 
pkgname=libxspf
pkgver=1.2.1
pkgrel=1
pkgdesc="Library that helps applications to read and write XSPF playlists"
url="http://libspiff.sourceforge.net/"
arch=('x86_64')
license=('custom')
depends=('uriparser' 'expat' 'gcc-libs')
source=(https://downloads.sourceforge.net/libspiff/$pkgname-$pkgver.tar.bz2)
md5sums=('2f3be63bd8ba11cf4e582d05549f5103')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --disable-test
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
