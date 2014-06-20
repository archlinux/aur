# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=etwm
pkgver=3.8.3
pkgrel=1
pkgdesc="Claude's Tab Window Manager with full ICCCM/EMWH support."
arch=('i686' 'x86_64')		
url="https://github.com/bbidulock/etwm/"
license=('custom:MIT/X Consortium')
depends=('libxinerama' 'libxrandr' 'libxmu' 'libxpm' 'libjpeg')
options=('!emptydirs')
backup=('etc/X11/etwm/system.etwmrc')
source=("https://github.com/bbidulock/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
md5sums=('0e4122799dc141fe803b8632821377d9')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --silent --prefix=/usr --sysconfdir=/etc
  make V=0
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
  install -Dm0644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set et sw=2:
