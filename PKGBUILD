# Maintainer: Popolon <popolon@popolon.org>
# Contributor: Piernov <piernov@piernov.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Franco Iacomella <yaco@gnu.org>

pkgname=etl-dev
pkgver=1.5.3
pkgrel=1
pkgdesc="VoriaETL: C++ STL complementory multiplatform template library"
arch=(x86_64 armv7h aarch64 riscv32 riscv64)
url="http://synfig.org"
license=('GPL2')
depends=()
makedepends=('glibmm')
conflicts=('synfig-etl' 'etl')
provides=('etl')
source=("https://github.com/synfig/synfig/archive/v$pkgver.tar.gz")
sha512sums=('799d5c6de004acc553c0242598b23dcafc31f1c176e7b45d1f38cf79aa4d57de474e993805b240440b707ebf9aed53634e74798d35f962f7e13d5a7c5a41b86f')

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
