# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=ogmrip-flac
pkgver=0.2
pkgrel=2
pkgdesc='Plugin which adds support for the FLAC audio codec for ogmrip'
arch=('i686' 'x86_64')
url='http://ogmrip.sourceforge.net/en/plugins.html'
license=('LGPL')
groups=('ogmrip')
depends=('ogmrip>=0.13' 'mplayer>=0.92' 'flac')
source=("http://downloads.sourceforge.net/sourceforge/ogmrip/${pkgname}-${pkgver}.tar.gz"
"http://downloads.sourceforge.net/project/ogmrip/${pkgname}/${pkgver}/README"
)
sha256sums=('2f15e7514c0bd472e0dccca55b9d10c793356090e04bf4b6642e777a6758dacd'
            'a8adca6e7b61e6a0f739e0437d28b8cad8a498209e50207b390f71a5530b1c4a')
build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm0644 README ${pkgdir}/usr/share/ogmrip-flac/README
}
