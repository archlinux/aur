# Maintainer: kevku <kevku@gmx.com>
pkgname=qdigidoc
pkgver=3.12.4.1476
pkgrel=1
pkgdesc="Qt based UI application for verifying and signing digital signatures"
arch=('x86_64' 'i686')
url="http://www.id.ee/"
license=('LGPL')
depends=('libdigidocpp>=3.12.2' 'qt5-base' 'shared-mime-info' 'ccid' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('cmake' 'opensc' 'qt5-tools' 'qt5-translations')
source=("https://installer.id.ee/media/ubuntu/pool/main/q/$pkgname/${pkgname}_$pkgver.orig.tar.xz")
sha256sums=('c3ffca608de9ac29bdd96fc184011eb711f80343f58ab45009c7e288ed6b335b')
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
