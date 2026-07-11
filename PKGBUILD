# Maintainer: Ali Kaya <alikayaa@gmail.com>
pkgname=mektu-bin
_appname=mektu
pkgver=0.1.0
pkgrel=1
pkgdesc="Mektu — AI-powered email, task and calendar desktop client"
arch=('x86_64')
url="https://mektu.io"
license=('custom')
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3')
provides=('mektu')
conflicts=('mektu')
options=(!strip !debug)
source=("$pkgname-$pkgver.deb::https://mektu.io/downloads/mektu-linux-x86_64.deb")
sha256sums=('9d081cdde174cbd9b1bf900038e604dda1d740071d9792d1b8e287c96aef8b0d')

package() {
  # Extract the prebuilt .deb (data.tar.*) straight into pkgdir:
  # usr/bin/mektu, usr/share/applications, hicolor icons.
  bsdtar -xf "$pkgname-$pkgver.deb" -C "$srcdir"
  bsdtar -xf "$srcdir"/data.tar.* -C "$pkgdir"
}
