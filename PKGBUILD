# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Thomas Ascher <thomas.ascher@gmx.at>

pkgname=terminal.app
pkgrel=1
pkgver=0.9.9
pkgdesc='A terminal emulator for GNUstep'
arch=('i686' 'x86_64')
url='http://www.nongnu.org/gap/terminal/index.html'
license=('GPL2')
groups=('gnustep')
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back')
makedepends=('gcc-objc')
source=("https://savannah.nongnu.org/download/gap/Terminal-$pkgver.tar.gz")
sha256sums=('27f81bbecdbd10cde8c080012cde4973bec20e551c58c29f353733cf03c220e9')

build() {
  cd Terminal-$pkgver
  make
}

package() {
  cd Terminal-$pkgver
  make DESTDIR="$pkgdir" install
  install -d "$pkgdir"/usr/share/applications
  ln -s /usr/lib/GNUstep/Applications/Terminal.app/Resources/Terminal.desktop \
    "$pkgdir"/usr/share/applications/Terminal.desktop
}
