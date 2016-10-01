# Maintainer: kso <keansum AT gmail DOT com>

pkgname=freechart
pkgver=1.7
pkgrel=1
pkgdesc="Free powerful charting framework based on wxWidgets"
arch=('x86_64' 'i686')
url="http://wxcode.sourceforge.net/components/freechart/"
license=('custom:"wxWindows"')
depends=('wxgtk')
makedepends=('git')
source=('git+https://github.com/jasin/freechart')
md5sums=('SKIP')

build() {
  cd "$pkgname"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir/" install

  # install LICENSE
  install -D -m644 $srcdir/$pkgname/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
