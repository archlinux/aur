# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=ogmrip-dirac
pkgver=0.2
pkgrel=2
pkgdesc='Plugin for OGMRip which enables transcoding to dirac for ogmrip'
arch=('i686' 'x86_64')
url='http://ogmrip.sourceforge.net/en/plugins.html'
license=('LGPL')
groups=('ogmrip')
depends=('ogmrip>=0.13' 'dirac>=0.9')
makedepends=('intltool>=0.35')
source=("http://downloads.sourceforge.net/sourceforge/ogmrip/${pkgname}-${pkgver}.tar.gz"
"http://downloads.sourceforge.net/project/ogmrip/${pkgname}/${pkgver}/README"
)
sha256sums=('10720dea17e642e7a25f5c716a19662736c8a1c9411929f1d25d469a59acf7b9'
            '7027be3dbff6e7deb32549de5c84b436632cc974a459e33e040f53562a0e8d8b')
build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make DESTDIR="$pkgdir/" install
  install -Dm0644 README ${pkgdir}/usr/share/${pkgname}/README
}
