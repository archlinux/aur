# Maintainer: Adam Fontenot <fontenot@ucla.edu>

pkgname=libheif
pkgver=1.3.0
pkgrel=1
pkgdesc="HEIF file format decoder and encoder"
arch=('i686' 'x86_64')
url="https://github.com/strukturag/libheif"
license=('GPL3')
depends=('libde265')
optdepends=('x265: HEIF encoding')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f8abfbda4236b7efe8a28476e58c4baeac6a56f25d4e3acfa687ac5631d9188a')

prepare() {
  cd "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr --enable-static=no
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
