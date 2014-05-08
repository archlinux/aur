pkgname=windwm
pkgver=1.4
pkgrel=3
pkgdesc="Wind is window manager  implements most parts of the ICCCM and EWMH/NetWM standards"
arch=('x86_64' 'i686')
url="http://windwm.sourceforge.net/"
license=('custom')
depends=('libxft')
source=("http://downloads.sourceforge.net/project/windwm/wind-${pkgver}.tar.gz"
	"windwm.desktop")
sha1sums=('a82170712bac5427efeae9d0fac28df7fdfc8b9d'
          'fdf5db200cf880328254dd01015e06c0de807655')

build() {
  cd "$srcdir/wind-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/wind-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/windwm/LICENSE"
  cd "$srcdir"
  install -Dm0644 windwm.desktop "$pkgdir/usr/share/xsessions/windwm.desktop"
}
