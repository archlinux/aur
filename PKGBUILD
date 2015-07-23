# Maintainer: Oliver Giles <web ohwg net>
pkgname=sequeljoe
pkgver=0.4
pkgrel=1
pkgdesc="SQL database administration tool"
arch=('i686' 'x86_64')
url='http://sequeljoe.ohwg.net'
license=('GPL3')
groups=()
depends=('qt5-base' 'libssh2' 'libnotify')
optdepends=(
  'libmariadbclient: MySQL/MariaDB support'
  'sqlite: sqlite support'
  'postgresql-libs: PostgreSQL support (experimental)'
)
makedepends=('cmake')
options=('strip')
source=("https://github.com/ohwgiles/sequeljoe/archive/$pkgver.zip")
md5sums=('a715fb01f3f03d16bbaa5a695c7db299')

build() {
  cd $pkgname-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release src
  make -j4
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

