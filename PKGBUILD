# Maintainer: Ali Kaya <alikayaa@gmail.com>
pkgname=mektu-bin
_appname=mektu
pkgver=0.2.12
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
sha256sums=('08b65a0cb9e4ed2895b3fdee0bf43b661192488bf0bf3edecf8f01340fde14f6')

package() {
  # Extract the prebuilt .deb (data.tar.*) straight into pkgdir:
  # usr/bin/mektu, usr/share/applications, hicolor icons.
  bsdtar -xf "$pkgname-$pkgver.deb" -C "$srcdir"
  bsdtar -xf "$srcdir"/data.tar.* -C "$pkgdir"
}
