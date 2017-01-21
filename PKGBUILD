# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
pkgname=tutka
pkgver=1.1.0
pkgrel=1
pkgdesc="A free tracker style MIDI sequencer for GNU/Linux."
arch=('i686' 'x86_64')
url="http://www.nongnu.org/tutka/"
license=('GPL')
depends=('qt5-base' 'alsa-lib' 'hicolor-icon-theme')
makedepends=('qt5-tools')
source=(http://download.savannah.gnu.org/releases/tutka/$pkgname-$pkgver.tar.xz)
md5sums=('8af014676139400058fbb67c9fe31210')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  qmake INSTALL_DIR="$pkgdir"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir/" install
}
