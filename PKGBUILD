# Contributor: naquad <naquad@gmail.com>
# Contributor: TJM <tommy.mairo@gmail.com> (0xC62463BE9F6B2D7D)

pkgname=http_load
pkgver=2016.03.09
pkgrel=1
pkgdesc="http_load is a webserver performance testing tool."
arch=(i686 x86_64)
url="http://www.acme.com/software/http_load/"
license=('GPL')
groups=('network')
makedepends=("pkgconfig")
provides=('http_load')
_reldate=09Mar2016
source=("http://www.acme.com/software/http_load/http_load-$_reldate.tar.gz")
sha256sums=("5a7b00688680e3fca8726dc836fd3f94f403fde831c71d73d9a1537f215b4587")


build() {
  cd "$srcdir"/http_load-$_reldate

  sed -ie 's#/usr/local/#/usr/#g' Makefile
  make
}

package(){
  cd "$srcdir"/http_load-$_reldate
  mkdir -p "$pkgdir"/usr/{share/man/man1,bin}
  cp http_load "$pkgdir"/usr/bin/
  cp http_load.1 "$pkgdir"/usr/share/man/man1
}

