# Maintainer: ThecaTTony <thecattony at gmx dot com>
# Contributer: <giacomogiorgianni at gmail dot com>

_pkgname=QuiteRSS
pkgname=quiterss
pkgver=0.18.3
pkgrel=1
pkgdesc="Fast and light RSS/Atom feed reader written on Qt/С++"
arch=('i686' 'x86_64')
url="http://quiterss.org/"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-webkit' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('qt5-tools')
install=$pkgname.install
source=("http://quiterss.org/files/$pkgver/$_pkgname-$pkgver-src.tar.gz")
sha512sums=('e4a6348999c265c5c383cd02e80e027febdf3b71aac3b7934feecf8507d71954dcf3b0ceb4216f21965278630f37f4ba6d1e946252a84ced9b8e52ef1ae4b595')

build() {
cd "$srcdir"
qmake-qt5 "$srcdir/$_pkgname.pro" \
  PREFIX=/usr \
  CONFIG+=LINUX_INTEGRATED \
  DISABLE_PHONON=1 \
  INSTALL_ROOT_PATH="$pkgdir"
make
}
package() {
cd "$srcdir"
make INSTALL_ROOT="$pkgdir" install
}
