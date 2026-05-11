pkgname=twintaillauncher-bin
_pkgname="${pkgname%-bin}"
pkgver=2.1.1
pkgrel=1
pkgdesc="A multi-platform launcher for your anime games"
arch=('x86_64' 'aarch64')
url="https://github.com/TwintailTeam/TwintailLauncher"
license=('GPL-3.0-only')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'pango' 'webkit2gtk-4.1' 'libappindicator-gtk3' 'libayatana-appindicator' 'mangohud')
optdepends=('gamemode: Feral Interactive gamemode utility')
options=('!debug')
provides=("twintaillauncher")
conflicts=("twintaillauncher-git" "twintaillauncher")
source_x86_64=("${_pkgname}-${pkgver}-amd64.deb::${url}/releases/download/ttl-v${pkgver}/twintaillauncher_${pkgver}_amd64.deb")
source_aarch64=("${_pkgname}-${pkgver}-arm64.deb::${url}/releases/download/ttl-v${pkgver}/twintaillauncher_${pkgver}_arm64.deb")
sha256sums_x86_64=('c3f443d71d0ae1e2dd3a55d7694bc98e91f7d1d31d1522d66b7c0f23ca138608')
sha256sums_aarch64=('0e3dde63b499cd927d32d7a8d8b53daa8a86e60a66596b8d40c6b93b8c58855f')

build() {
  bsdtar -x -f data.tar.gz
}

package() {
  install -Dm755 usr/bin/twintaillauncher -t "$pkgdir/usr/bin"
  install -Dm755 usr/lib/twintaillauncher/resources/reaper -t "$pkgdir/usr/lib/twintaillauncher/resources"
  install -Dm755 usr/lib/twintaillauncher/resources/winetricks -t "$pkgdir/usr/lib/twintaillauncher/resources"
  install -Dm644 usr/lib/twintaillauncher/resources/hkrpg_patch.dll -t "$pkgdir/usr/lib/twintaillauncher/resources"
  install -Dm644 usr/share/icons/hicolor/32x32/apps/twintaillauncher.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/$_pkgname.png"
  install -Dm644 usr/share/icons/hicolor/128x128/apps/twintaillauncher.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/$_pkgname.png"
  install -Dm644 usr/share/icons/hicolor/256x256@2/apps/twintaillauncher.png "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/$_pkgname.png"
  install -Dm644 usr/share/applications/twintaillauncher.desktop -t "$pkgdir/usr/share/applications"
}
