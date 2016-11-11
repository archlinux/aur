# Maintainer : Elvin L <elvin@eelviny.me>

pkgname=rocrail
pkgver=git
pkgrel=11643
pkgdesc="Rocrail - Model Railroad Control System"
arch=('x86_64' 'i686')
url='http://wiki.rocrail.net/'
license=('Proprietary')
depends=('wxgtk' 'libusb' 'webkitgtk2')
makedepends=()
source=("http://home.eelviny.me:8051/$pkgname-$pkgrel-arch-$CARCH.tar.xz")
sha256sums=('142629b3f581b654e2b4e97d9936e496d70d51238b2daca84ab52cff5cb08979')

package() {
  cd "$srcdir/"
  
  #install -d $pkgdir/opt/rocrail
  #install -Dm644 ./* "$pkgdir/opt/rocrail/*"
  mkdir -p $pkgdir/opt/rocrail
  cp -r * $pkgdir/opt/rocrail/
  chmod -R 644 $pkgdir/opt/rocrail
  install -Dm644 Rocrail.desktop "$pkgdir/usr/share/applications/Rocrail.desktop"
  install -Dm644 Rocview.desktop "$pkgdir/usr/share/applications/Rocview.desktop"
  install -Dm644 Rocrail.directory "$pkgdir/usr/share/desktop-directories/Rocrail.directory"
}
