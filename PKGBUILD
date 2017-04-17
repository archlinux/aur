# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Kyle Terrien <kyleterrien at gmail dot com>

pkgname=wmload
pkgver=0.9.7
pkgrel=1
pkgdesc="Dockable CPU indicator for Window Maker"
arch=('i686' 'x86_64')
url="http://www.dockapps.net/wmload"
license=('GPL')
depends=('libxpm')
source=("http://www.dockapps.net/download/wmload-$pkgver.tar.gz")
sha256sums=('efaf701799ca187e4f45ac11240db9461253d4b34158d50d2fdb6693a8ddb6b1')

build() {
  cd dockapps-dc20366
  make
}

package() {
  cd dockapps-dc20366
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 README "$pkgdir"/usr/share/doc/wmload/README
}
