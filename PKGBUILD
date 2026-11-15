# Maintainer: amanomasato
pkgname=emposium
pkgver=0.7.1
pkgrel=1
pkgdesc='Anime, manga and community in one application'
arch=('x86_64')
url='https://emposium.ru'
license=('custom')
depends=('dbus' 'webkit2gtk-4.1' 'gtk3' 'glib-networking' 'libayatana-appindicator' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-libav')
optdepends=('gnome-keyring: Secret Service for secure session storage')
options=('!strip')
source=("emposium-${pkgver}.tar.gz::https://api.mpsm.app/v1/releases/0.7.1/downloads/linux-tar")
sha256sums=('edecee6c6bc9eb21413e65dc72158771de6741d3343778027a9137d67e4f66e6')

package() {
  install -Dm755 "$srcdir/emposium/bin/emposium" "$pkgdir/usr/lib/emposium/emposium"
  install -Dm755 "$srcdir/emposium/emposium-managed" "$pkgdir/usr/bin/emposium"
  install -Dm644 "$srcdir/emposium/ru.emposium.app.desktop" "$pkgdir/usr/share/applications/ru.emposium.app.desktop"
  install -Dm644 "$srcdir/emposium/emposium.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/ru.emposium.app.png"
  install -Dm644 "$srcdir/emposium/THIRD-PARTY-NOTICES.txt" "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-NOTICES.txt"
  install -Dm644 "$srcdir/emposium/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
