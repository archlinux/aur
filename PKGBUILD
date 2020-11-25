# Maintainer: Popolon <popolon@popolon.org>
# Contributor: Piernov <piernov@piernov.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Franco Iacomella <yaco@gnu.org>

pkgname=etl-dev
pkgver=1.4.0
pkgrel=1
pkgdesc="VoriaETL: C++ STL complementory multiplatform template library"
arch=(any)
url="http://synfig.org"
license=('GPL2')
depends=()
conflicts=('synfig-etl' 'etl')
replaces=('synfig-etl')
provides=('etl')
source=("https://github.com/synfig/synfig/archive/v$pkgver.tar.gz")
sha512sums=('12688059d8b09739d092b7785f5f10e70e0def21ae00d056229034db1320d94c96d00a7afb8eeab5e968ea067df74f95cc285919b0a0a5ce7a4d4a78256cd3e1')

prepare() {
  cd "$srcdir"/synfig-$pkgver/ETL
  autoreconf -fi
}

build() {
  cd "$srcdir"/synfig-$pkgver/ETL
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/synfig-$pkgver/ETL
  make DESTDIR="$pkgdir" install
}
