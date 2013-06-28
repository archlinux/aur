# Contributor: Philipp Schmitt (attentah@NOSPAM.gmail.com)

pkgname=g9xled
pkgver=1
pkgrel=2
pkgdesc="Logitech G9X LED color control utility"
arch=('i686' 'x86_64')
url="http://als.regnet.cz/logitech-g9-linux-led-color.html"
license=('unknown')
depends=('libusb')
makedepends=('gcc')
install="$pkgname.install"
source=('https://raw.github.com/pschmitt/g9xled/master/g9xled.c')
noextract=('g9xled.c')
md5sums=('0a8ba5b00ca0663cd6dd6efa30597cbd')

package() {
  cd "$srcdir"
  mkdir -p $pkgdir/usr/bin
  install -m755 g9xled $pkgdir/usr/bin
}


build() {
  # Create destination directories
  cd "$srcdir"

  # Compile 
  gcc g9xled.c -o g9xled -lusb
}
