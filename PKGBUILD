# Contributer: fnord0 <fnord0 AT riseup DOT net>
pkgname=spooftooph
pkgver=0.5.2
pkgrel=1
pkgdesc="Designed to automate spoofing or cloning Bluetooth device Name, Class, and Address. Cloning this information effectively allows Bluetooth device to hide in plain site"
arch=('i686' 'x86_64')
#url="http://www.hackfromacave.com/projects/spooftooph.html"
url="http://sourceforge.net/projects/spooftooph/"
license=('GPL')
depends=('bluez' 'bluez-libs' 'ncurses')
source=(http://downloads.sourceforge.net/spooftooph/$pkgname-$pkgver.tar.gz)
md5sums=('469f803d4d4c8dabdb7c9ba08d04404c')

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 spooftooph "$pkgdir/usr/bin/$pkgname"
  install -Dm644 CHANGELOG "$pkgdir/usr/share/$pkgname/doc/CHANGELOG"
  install -Dm644 README    "$pkgdir/usr/share/$pkgname/doc/README"
}
