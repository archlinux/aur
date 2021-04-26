# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=gkrellm-fchart
pkgver=1.0.3
pkgrel=3
pkgdesc="general-purpose plugin for gkrellm"
url="https://www.cs.hmc.edu/~geoff/gkrellm-fchart.html"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gkrellm')
source=("http://www.cs.hmc.edu/~geoff/tars/gkrellm-fchart-${pkgver}.tgz")
md5sums=('7c8a11bd724019b4f8886c2a3c111521')

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -m755 -D fchart.so $pkgdir/usr/lib/gkrellm2/plugins/fchart.so
  install -Dm644 README $pkgdir/usr/share/doc/$pkgname/README
  install -Dm755 scripts/ntpgrabber $pkgdir/usr/share/doc/$pkgname/scripts/ntpgrabber
  install -Dm755 scripts/pingtimer $pkgdir/usr/share/doc/$pkgname/scripts/pingtimer
  install -Dm755 scripts/tideplot $pkgdir/usr/share/doc/$pkgname/scripts/tideplot
}
