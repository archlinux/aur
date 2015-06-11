# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: TDY <tdy@gmx.com>
# Contributor: Maksim Sipos <maxsipos__gmail>

pkgname=hpanel
pkgver=0.3.2
pkgrel=3
pkgdesc="A lightweight taskbar panel for NetWM compliant window managers"
arch=('i686' 'x86_64')
url="http://freshmeat.net/projects/hpanel/"
license=('MIT')
depends=('libxft' 'libxpm')
source=(http://www.phrat.de/$pkgname-$pkgver.tar.gz
        $pkgname.patch)
md5sums=('94eda6b7a14253f5e36b2cea57a14b01'
         'e79f336982e85709e991fa1c9f466831')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np2 -b -z .old -i ../$pkgname.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
