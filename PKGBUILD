# Maintainer: kevku <kevku@gmx.com>
pkgname=libdigidocpp
pkgver=3.11.1.1304
pkgrel=2
pkgdesc="Library for creating DigiDoc signature files"
arch=('x86_64' 'i686')
url="http://www.id.ee/"
license=('LGPL')
depends=('xml-security-c' 'minizip' 'libdigidoc')
makedepends=('cmake' 'xsd>=4.0' 'pcsclite' 'opensc')
conflicts=('libdigidocpp-svn' 'sk-libdigidocpp-svn')
source=("https://installer.id.ee/media/ubuntu/pool/main/libd/$pkgname/${pkgname}_$pkgver.orig.tar.xz")
sha256sums=('e3059b3e2ac7dce3d0609f806fe05b7ec88210000d2b50f68aa7cede86c958c7')
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
