# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: bocke <bocke@mycity.rs>

pkgname=xorg-editres
_pkgname=editres
pkgver=1.0.6
pkgrel=1
pkgdesc="a dynamic resource editor for X Toolkit applications"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('libxt' 'libxaw')
makedepends=('xorg-util-macros')
source=("http://xorg.freedesktop.org/releases/individual/app/$_pkgname-$pkgver.tar.bz2")
md5sums=('623322610e4040393e0ff2a69e6612cd')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}
package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -m755 -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/"
}
