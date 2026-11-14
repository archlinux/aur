# Maintainer: amanomasato
pkgname=emposium
pkgver=0.7.0
pkgrel=1
pkgdesc='Anime, manga and community in one application'
arch=('x86_64')
url='https://emposium.ru'
license=('custom')
depends=('dbus' 'webkit2gtk-4.1' 'gtk3' 'glib-networking' 'libayatana-appindicator' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-libav')
optdepends=('gnome-keyring: Secret Service for secure session storage')
options=('!strip')
source=("emposium-${pkgver}.tar.gz::https://api.mpsm.app/v1/releases/0.7.0/downloads/linux-tar")
sha256sums=('802146a863c7b72fad51883cde6a5c095b645c4b4bf36692a55877939294e977')

package() {
  install -Dm755 "$srcdir/emposium/bin/emposium" "$pkgdir/usr/lib/emposium/emposium"
  install -Dm755 "$srcdir/emposium/emposium-managed" "$pkgdir/usr/bin/emposium"
  install -Dm644 "$srcdir/emposium/ru.emposium.app.desktop" "$pkgdir/usr/share/applications/ru.emposium.app.desktop"
  install -Dm644 "$srcdir/emposium/emposium.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/ru.emposium.app.png"
  install -Dm644 "$srcdir/emposium/THIRD-PARTY-NOTICES.txt" "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-NOTICES.txt"
  install -Dm644 "$srcdir/emposium/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
