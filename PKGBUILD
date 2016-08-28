# Maintainer:  Marcin Wieczorek <marcin@marcin.co>

pkgname=inadyn-mt
pkgver=02.28.07
pkgrel=1
pkgdesc="A simple dynamic DNS client based on inadyn"
arch=('i686' 'x86_64')
url="http://inadyn-mt.sourceforge.net"
license=('GPL3')
depends=('libao')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname.v.$pkgver.tar.gz)
md5sums=('295c687c2ef7bcd5af5086d3965a29a0')

build() {
  cd "$pkgname.v.$pkgver"
  ./configure
  make all
}

package() {
  cd "$pkgname.v.$pkgver"

  # install binary
  install -Dm755 bin/linux/$pkgname "$pkgdir/usr/bin/$pkgname"
  # install manuals
  install -m755 -d "$pkgdir"/usr/share/man/man{5,8}
  install -m644 man/*.5 "$pkgdir"/usr/share/man/man5/
  install -m644 man/*.8 "$pkgdir"/usr/share/man/man8/
}

# vim:set ts=2 sw=2 et:
