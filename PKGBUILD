# Maintainer: TDY <tdy@gmx.com>

pkgname=meteorite
pkgver=0.10
pkgrel=1
pkgdesc="A Matroska/MKV repair engine"
arch=('i686' 'x86_64')
url="http://meteorite.sourceforge.net/"
license=('GPL')
depends=('wxgtk')
source=(http://downloads.sourceforge.net/$pkgname/Meteorite_v$pkgver-src.tar.bz2)
md5sums=('fe01bcb1e817d98616ef7d725b3c490c')

build() {
  cd "$srcdir/Meteorite_v$pkgver"
  ./make.sh || return 1
}

package() {
  cd "$srcdir/Meteorite_v$pkgver"
  install -Dm755 Meteorite "$pkgdir/usr/bin/$pkgname"
}
