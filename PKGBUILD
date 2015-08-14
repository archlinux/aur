# Maintainer: kevku <kevku@gmx.com>
pkgname=libdigidocpp
pkgver=3.11.0.1296
pkgrel=1
pkgdesc="Library for creating DigiDoc signature files"
arch=('x86_64' 'i686')
url="http://www.id.ee/"
license=('LGPL')
depends=('xml-security-c' 'minizip' 'libdigidoc')
makedepends=('cmake' 'xsd>=4.0' 'pcsclite' 'opensc')
conflicts=('libdigidocpp-svn' 'sk-libdigidocpp-svn')
source=("https://installer.id.ee/media/ubuntu/pool/main/libd/$pkgname/${pkgname}_$pkgver.orig.tar.xz")
sha256sums=('750f75bfe0087567b40a4ce36e95c6cdfb356261ebb7924a920c117aa0d8e6b9')
validpgpkeys=('43650273CE9516880D7EB581B339B36D592073D4')

build() {
  cd "$srcdir/"
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR="lib" -DCMAKE_INSTALL_SYSCONFDIR="/etc" -DINSTALL_DOC=NO -DSWIG_EXECUTABLE=""
  make 
}

package() {
  cd "$srcdir/"
  make DESTDIR="$pkgdir/" install
}
