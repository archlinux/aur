# Maintainer: kevku <kevku@gmx.com>
pkgname=qdigidoc
pkgver=3.11.1.1426
pkgrel=1
pkgdesc="Qt based UI application for verifying and signing digital signatures"
arch=('x86_64' 'i686')
url="http://www.id.ee/"
license=('LGPL')
depends=('libdigidocpp' 'qt5-base' 'libldap' 'shared-mime-info' 'esteidcerts' 'ccid' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('cmake' 'opensc' 'qt5-tools' 'qt5-translations')
conflicts=('qdigidoc-svn' 'sk-qdigidoc-svn')
install=qdigidoc.install
source=("https://installer.id.ee/media/ubuntu/pool/main/q/$pkgname/${pkgname}_$pkgver.orig.tar.xz")
sha256sums=('651668ceb655786b131edc714ff87ef9612f763d26b3bccf81836adb7fecb4d5')
validpgpkeys=('43650273CE9516880D7EB581B339B36D592073D4')

build() {
  cd "$srcdir/"
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR="lib" -DCMAKE_INSTALL_SYSCONFDIR="/etc"
  make
}

package() {
  cd "$srcdir/"
  make DESTDIR="$pkgdir/" install
}
