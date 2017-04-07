# Maintainer: 2ion <dev@2ion.de>
# Former maintainer:  TDY <tdy@archlinux.info>
# Contributor: muflax <muflax@gmail.com>
pkgname=eb-library
pkgver=4.4.3
pkgrel=2
pkgdesc="EB library for several dictionary formats, including EPWING"
arch=('any')
url="https://web-beta.archive.org/web/20120401145849/http://www.sra.co.jp/people/m-kasahr/eb"
license=('BSD')
makedepends=('autoconf' 'automake')
depends=('perl' 'gcc-libs')
options=('!libtool')
source=(ftp://ftp.sra.co.jp/pub/misc/eb/eb-$pkgver.tar.bz2)
md5sums=('17dd1fade7ba0b82ce6e60f19fcbc823')

build() {
  cd "$srcdir/eb-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/eb-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
