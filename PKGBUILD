pkgname=inadyn-mt
pkgver=2.24.38
pkgrel=4
pkgdesc="A simple dynamic DNS client based on inadyn"
arch=('i686' 'x86_64')
url="http://inadyn-mt.sourceforge.net/"
license=('GPL3')
depends=('glibc' 'libao')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname.v.0$pkgver.tar.gz)
md5sums=('e868ab86df2eb20a1d98c11e8564e52c')

build() {
  cd "$pkgname.v.0$pkgver"
  ./configure
  make all
}

package() {
  cd "$pkgname.v.0$pkgver"

  # install binary
  install -Dm755 bin/linux/$pkgname "$pkgdir/usr/bin/$pkgname"
  # install manuals
  install -m755 -d "$pkgdir"/usr/share/man/man{5,8}
  install -m644 man/*.5 "$pkgdir"/usr/share/man/man5/
  install -m644 man/*.8 "$pkgdir"/usr/share/man/man8/
}

# vim:set ts=2 sw=2 et:
