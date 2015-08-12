# Maintainer: ThecaTTony <thecattony at gmx dot com>
# Contributer: <giacomogiorgianni at gmail dot com>

_pkgname=QuiteRSS
pkgname=quiterss
pkgver=0.18.2
pkgrel=1
pkgdesc="Fast and light RSS/Atom feed reader written on Qt/С++"
arch=('i686' 'x86_64')
url="http://quiterss.org/"
license=('GPL3')
depends=('qtwebkit')
makedepends=('cmake' 'gettext' 'automoc4')
install=$pkgname.install
source=("http://quiterss.org/files/$pkgver/$_pkgname-$pkgver-src.tar.gz")
sha512sums=('ff441887de758f0cdbab32db7a3e730024261c058f487c3409a872554f1fee35ba62f2e7fbd91b0aacfcd09fbf2b1c33a18d96f4153c0c171ea458ac9099b44a')

build() {
cd "$srcdir"
qmake-qt4 "$srcdir/$_pkgname.pro" \
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
