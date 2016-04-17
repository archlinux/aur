# Contributor: naquad <naquad@gmail.com>
pkgname=http_load
pkgver=2014.8.14
pkgrel=1
pkgdesc="http_load is a webserver performance testing tool."
arch=(i686 x86_64)
url="http://www.acme.com/software/http_load/"
license=('GPL')
groups=('network')
makedepends=("pkgconfig")
provides=('http_load')
_reldate=14aug2014
source=("http://www.acme.com/software/http_load/http_load-$_reldate.tar.gz")
md5sums=('44514f4f1f2a4791be6f2e003618ae99')


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

# vim:set ts=2 sw=2 et:
