# Maintainer: Popolon <popolon@popolon.org>
# Contributor: Piernov <piernov@piernov.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Franco Iacomella <yaco@gnu.org>

pkgname=etl-dev
pkgver=1.5.1
pkgrel=2
pkgdesc="VoriaETL: C++ STL complementory multiplatform template library"
arch=(x86_64 armv7h aarch64 riscv32 riscv64)
url="http://synfig.org"
license=('GPL2')
depends=()
makedepends=('glibmm')
conflicts=('synfig-etl' 'etl')
replaces=('synfig-etl')
provides=('etl')
source=("https://github.com/synfig/synfig/archive/v$pkgver.tar.gz")
sha512sums=('0c1dd53a445f037bcdb742d7c17d1d3a2039e80d3e49f5cd67119fb9792d96b47154874d5be42d36443b0d09c61b7864dfe33ebd5f3998783c54eb3cc936d11b')

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
