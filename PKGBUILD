# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=eezupnp
pkgver=2.6.0
pkgrel=3
pkgdesc="UPnP Audio control point"
arch=('x86_64')
url="http://www.eezupnp.de/"
license=('custom:eezupnp')
depends=('jre8-openjdk' 'gtk2')
source=("http://www.eezupnp.de/archives/eezupnp-$pkgver.linux.gtk.x86_64.zip" "License.txt")
sha256sums=('428b1f54ff47a2db94f9ef46e370cb9ce859d00f8d5e3daf2b9a5228e709f73e' 'fc44b250ee98341818d6c76dd8787f02378c61b2d33970555a1fac8511710fb1')
options=(!strip)

package() {
  cd "$srcdir"
  mkdir -p ${pkgdir}/opt/
  bsdtar xf eezupnp-$pkgver.linux.gtk.x86_64.zip -C "$pkgdir/opt"
  install -Dm644 "License.txt" \
  "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
