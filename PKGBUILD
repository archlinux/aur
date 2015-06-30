# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=eezupnp
pkgver=2.7.0
pkgrel=1
pkgdesc="UPnP Audio control point"
arch=('x86_64')
url="http://www.eezupnp.de/"
license=('custom:eezupnp')
depends=('jre8-openjdk' 'gtk2')
source=("http://www.eezupnp.de/archives/eezupnp-$pkgver.linux.gtk.x86_64.zip" "License.txt")
sha256sums=('c283539d1874c87d30cf915fededa71eae37eaae2ebe0413c262c1fe4e3615b9' 'fc44b250ee98341818d6c76dd8787f02378c61b2d33970555a1fac8511710fb1')
options=(!strip)

package() {
  cd "$srcdir"
  mkdir -p ${pkgdir}/opt/
  bsdtar xf eezupnp-$pkgver.linux.gtk.x86_64.zip -C "$pkgdir/opt"
  install -Dm644 "License.txt" \
  "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
