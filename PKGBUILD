# Maintainer: Cam Webb <cw at camwebb dot com>

pkgname=gawk-csv
_project=gawkextlib
pkgver=1.0.0
pkgrel=1
pkgdesc="GAWK extension - read, parse, compose and write CVS"
arch=('x86_64')
url="https://sourceforge.net/projects/gawkextlib/"
license=('GPL-3.0-or-later')
depends=('gawkextlib' 'glibc')
source=("https://sourceforge.net/projects/gawkextlib/files/snapshot/gawk-csv-snapshot.tar.gz/download")
md5sums=('5230204bdaecf8b65844139ce9af8dce')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --enable-silent-rules
  make
}

check() {
  cd "$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
