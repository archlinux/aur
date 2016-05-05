# Maintainer: kevku <kevku@gmx.com>
pkgname=libdigidocpp
pkgver=3.12.1.1322
pkgrel=1
pkgdesc="Library for creating DigiDoc signature files"
arch=('x86_64' 'i686')
url="http://www.id.ee/"
license=('LGPL')
depends=('xml-security-c' 'minizip' 'libdigidoc')
makedepends=('cmake' 'xsd>=4.0' 'pcsclite' 'opensc' 'xxd')
source=("https://installer.id.ee/media/ubuntu/pool/main/libd/$pkgname/${pkgname}_$pkgver.orig.tar.xz")
sha256sums=('5f21dd80e6526343df30ee8627edde17f842f23fd830e9b2efb424cf24e19a91')
validpgpkeys=('43650273CE9516880D7EB581B339B36D592073D4')

build() {
  cd "$srcdir/"
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR="lib" -DCMAKE_INSTALL_SYSCONFDIR="/etc" -DINSTALL_DOC=NO -DSWIG_EXECUTABLE="" -DBoost_INCLUDE_DIR=""
  make 
}

package() {
  cd "$srcdir/"
  make DESTDIR="$pkgdir/" install
}
