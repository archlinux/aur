# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
pkgname=tutka
pkgver=1.0.2
pkgrel=1
pkgdesc="A free tracker style MIDI sequencer for GNU/Linux."
arch=('i686' 'x86_64')
url="http://www.nongnu.org/tutka/"
license=('GPL')
depends=('qt5-base' 'alsa-lib' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('qt5-tools')
install=tutka.install
source=(http://download.savannah.gnu.org/releases/tutka/$pkgname-$pkgver.tar.xz)
md5sums=('5ab447458928353955be0e5fcf9912bb')
 
build() {
  cd "$srcdir/$pkgname-$pkgver"
  qmake INSTALL_DIR="$pkgdir"
  make
}
 
package() {
  cd "$srcdir/$pkgname-$pkgver"
 make INSTALL_ROOT="$pkgdir/" install
}
