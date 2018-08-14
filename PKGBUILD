# Maintainer: Icarus Mitchellson <mumei AT airmail DOT cc>

_pkgname=Addresses
pkgname=addresses
pkgrel=1
pkgver=0.4.7
pkgdesc='GNUstep address book for managing contact information.'
arch=('i686' 'x86_64' 'armv7h')
url='http://wiki.gnustep.org/index.php/Addresses'
license=('LGPL')
groups=('gnustep-apps')
depends=('gnustep-base' 'gnustep-gui')
makedepends=('gcc-objc')
source=("http://savannah.nongnu.org/download/gap/Addresses-0.4.7.tar.gz")
sha256sums=('ac2fe8cfe2e7cabcb51c74ecaba596bc399211f1560a7c45262af110ae365d73')

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$pkgdir/usr/lib/GNUstep/Applications/AddressManager.app/Resources/AddressManager.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}

