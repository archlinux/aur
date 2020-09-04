# Maintainer: Popolon <popolon@popolon.org>
# Contributor: Piernov <piernov@piernov.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Franco Iacomella <yaco@gnu.org>

pkgname=etl-dev
pkgver=1.3.16
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
sha512sums=('6cf5be662cc5bc26ad27bdc6ea3baae14ce6a100d214c38e873a88c6ad8acf7f7009ac3b09e2ed13c79650e75af5eb8e5d893ad9fd3f57ef1dce339799871381')

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
