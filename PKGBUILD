# Maintainer: TDY <tdy@archlinux.info>

pkgname=failsafewm
pkgver=0.0.2
pkgrel=1
pkgdesc="A frameless, low-footprint window manager designed for failsafe sessions"
arch=('i686' 'x86_64')
url="http://freecode.com/projects/failsafewm/"
license=('GPL')
depends=('libx11')
source=(http://www.small-window-manager.de/$pkgname-$pkgver.tgz
        $pkgname.1)
md5sums=('8ec6487cdf585775d9351f626d0de11f'
         '5e131ee1031fc84f0d07b7e829396bca')

build() {
  cd "$srcdir/$pkgname"
  make XROOT=/usr CFLAGS="$CFLAGS"
}

package() {
  cd "$srcdir"
  install -Dm755 $pkgname/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
}

# vim:set ts=2 sw=2 et:
