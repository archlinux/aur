# Maintainer: James Smith <jslonescout AT icloud DOT com>
# Contributor: Thomas Ascher <thomas.ascher@gmx.at>

_pkgname=Terminal
pkgname=terminal.app
pkgrel=3
pkgver=0.9.9
pkgdesc='A terminal emulator for GNUstep'
arch=('i686' 'x86_64' 'armv7h')
url='http://www.nongnu.org/gap/terminal/index.html'
license=('GPL2')
groups=('gnustep-apps')
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back')
makedepends=('gcc-objc')
source=("https://savannah.nongnu.org/download/gap/Terminal-$pkgver.tar.gz")
sha256sums=('27f81bbecdbd10cde8c080012cde4973bec20e551c58c29f353733cf03c220e9')

build() {
  cd "$_pkgname-$pkgver"
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$pkgdir/usr/lib/GNUstep/Applications/$_pkgname.app/Resources/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
