pkgname=twintaillauncher-bin
_pkgname="${pkgname%-bin}"
pkgver=1.0.8
pkgrel=1
pkgdesc="A multi-platform launcher for your anime games"
arch=('x86_64')
url="https://github.com/TwintailTeam/TwintailLauncher"
license=('GPL-3.0-only')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'pango' 'webkit2gtk-4.1' 'libappindicator-gtk3' 'libayatana-appindicator')
options=('!debug')
source=("${_pkgname}-${pkgver}.deb::${url}/releases/download/ttl-v${pkgver}/twintaillauncher_${pkgver}_amd64.deb")
sha256sums=('de2da6ce5348b53c0ddc53dc2e9b9f4491681435f34daec429bb1d7af59b78e9')

build() {
  bsdtar -x -f data.tar.gz
}

package() {
  install -Dm755 usr/bin/twintaillauncher -t "$pkgdir/usr/bin"
  install -Dm755 usr/lib/twintaillauncher/resources/7zr -t "$pkgdir/usr/lib/twintaillauncher/resources"
  install -Dm755 usr/lib/twintaillauncher/resources/krpatchz -t "$pkgdir/usr/lib/twintaillauncher/resources"
  install -Dm755 usr/lib/twintaillauncher/resources/hpatchz -t "$pkgdir/usr/lib/twintaillauncher/resources"
  install -Dm644 usr/share/icons/hicolor/32x32/apps/twintaillauncher.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/$_pkgname.png"
  install -Dm644 usr/share/icons/hicolor/128x128/apps/twintaillauncher.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/$_pkgname.png"
  install -Dm644 usr/share/icons/hicolor/256x256@2/apps/twintaillauncher.png "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/$_pkgname.png"
  install -Dm644 usr/share/applications/twintaillauncher.desktop -t "$pkgdir/usr/share/applications"
}
