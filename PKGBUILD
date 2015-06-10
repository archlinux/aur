# Contributor: Michael G. Henderson
# Contributor: Petr Hlavka
# Maintainer: Oleksandr Shatov <alexx67 at list dot ru>
pkgname=wmcalclockkbd
pkgver=0.1a
pkgrel=2
pkgdesc="Simple calendar WM dockapp with integrated keyboard group indicator, based on wmCalClock-1.25"
arch=('i686' 'x86_64')
#url="http://dockapps.windowmaker.org/file.php/id/214"
url="http://web.archive.org/web/20121101003315/http://dockapps.windowmaker.org/file.php/id/214"
license=('GPL')
depends=('libxpm')
#source=(http://dockapps.windowmaker.org/download.php/id/531/$pkgname-$pkgver.tar.gz)
source=($pkgname-$pkgver.tar.gz)
md5sums=('a994ad377fdf70a2401eb664e191237c')

build() {
  cd "$srcdir/wmCalClockKbd-$pkgver/src"
  make || return 1
}
package() {
  cd "$srcdir/wmCalClockKbd-$pkgver/src"
  mkdir -p $pkgdir/usr/bin $pkgdir/usr/share/man/man1
  make DESTDIR=$pkgdir/usr install
}
