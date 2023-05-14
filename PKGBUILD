# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=liboakleaf
pkgver=0.0.1
pkgrel=1
pkgdesc="Library which implements robust statistical estimates"
arch=(x86_64)
url="http://integral.physics.muni.cz/oakleaf"
license=(LGPL3)
depends=(libminpack)
makedepends=(gcc-fortran)

source=(ftp://integral.physics.muni.cz/pub/oakleaf/oakleaf-$pkgver.tar.gz)
sha256sums=('2bda78abeb483a48adfac6955aa73232a86f678549c2a84df8b7f05f314757c6')

_archive="oakleaf-$pkgver"

build() {
  cd "$_archive"

  ./configure --prefix=/usr --libexecdir=/usr/lib
  make
}

check() {
  cd "$_archive"

	make -k check
}

package() {
  cd "$_archive"

  make DESTDIR="$pkgdir/" install
}
