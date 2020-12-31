# Maintainer: Jan-Tarek Butt <tarek@ring0.de>

pkgname=netfabb-basic
pkgver=7.4.0
pkgrel=1
pkgdesc="view and repair STL files"
arch=('x86_64')
url="https://github.com/3DprintFIT/netfabb-basic-download/releases"
license=('custom:freeware')
depends=('gtk2' 'desktop-file-utils' 'hicolor-icon-theme')
install='netfabb-basic.install'
sha256sums=('1c1254997b418dd588de6ea3105981e0b86001dea29f322502b2df5ffb3feaa5') # 64-bit
nARCH=64

source=("netfabb-free_${pkgver}_linux${nARCH}.tar.gz::${url}/download/v${pkgver}/")

# Static content
source+=("icons.tar.gz" "netfabb-basic.desktop")
sha256sums+=( 'ae44b987b08bfaf2a16e250693bef705beddb3fc8612204220efba86fa4fa8ca' 'bf3891906b73724200839a651c74d53b175f810d52779ba925988c1d5236be9f')


package () {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin/"
  install -m 755 ./netfabb-free_${pkgver}_linux${nARCH}/netfabb_free "$pkgdir/usr/bin/netfabb-basic"
  install -d "$pkgdir/usr/lib/"
  install -m 755 ./netfabb-free_${pkgver}_linux${nARCH}/*.so.* "$pkgdir/usr/lib/"
  install -d "$pkgdir/usr/share/applications"
  install -m 644 ./*.desktop "$pkgdir/usr/share/applications/"

  # Install icons
  cp -R ${srcdir}/icons ${pkgdir}/usr/share/
}
