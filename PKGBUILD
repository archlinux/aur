# Maintainer: Popolon <popolon@popolon.org>
# Contributor: Piernov <piernov@piernov.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Franco Iacomella <yaco@gnu.org>

pkgname=etl-dev
pkgver=1.5.0
pkgrel=1
pkgdesc="VoriaETL: C++ STL complementory multiplatform template library"
arch=(x86_64 armv7h armv8 riscv32 riscv64)
url="http://synfig.org"
license=('GPL2')
depends=()
conflicts=('synfig-etl' 'etl')
replaces=('synfig-etl')
provides=('etl')
source=("https://github.com/synfig/synfig/archive/v$pkgver.tar.gz")
sha512sums=('a3beecdfae5508c6ccf0aa9ec44d817264266a5bb4b7dd580ade53c613658d34e5edc860c17ba5a2d7aa5c3c91a30bb8550b87623ccaad53a4b584cc93852c40')

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
