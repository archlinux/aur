# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
pkgname=tutka
pkgver=1.1.2
pkgrel=1
pkgdesc="A free tracker style MIDI sequencer for GNU/Linux."
arch=('i686' 'x86_64')
url="http://www.nongnu.org/tutka/"
license=('GPL')
depends=('qt5-base' 'alsa-lib' 'hicolor-icon-theme')
makedepends=('qt5-tools')
source=(http://download.savannah.gnu.org/releases/tutka/$pkgname-$pkgver.tar.xz)
md5sums=('83bc4729fb157490eeb73d2281e480f0')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  qmake INSTALL_DIR="$pkgdir"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir/" install
}
