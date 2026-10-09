# Maintainer: amanomasato
pkgname=emposium
pkgver=0.6.2
pkgrel=1
pkgdesc='Anime, manga and community in one application'
arch=('x86_64')
url='https://emposium.ru'
license=('custom')
depends=('dbus' 'webkit2gtk-4.1' 'gtk3' 'glib-networking' 'libayatana-appindicator' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-libav')
optdepends=('gnome-keyring: Secret Service for secure session storage')
options=('!strip')
source=("emposium-${pkgver}.tar.gz::https://api.emposium.ru/v1/releases/0.6.2/downloads/linux-tar")
sha256sums=('941d4ac426cb09d9b5dbe35ef8b734bae45241a99efcfdb3a92cdec5a7762b58')

package() {
  install -Dm755 "$srcdir/emposium/bin/emposium" "$pkgdir/usr/lib/emposium/emposium"
  install -Dm755 "$srcdir/emposium/emposium-managed" "$pkgdir/usr/bin/emposium"
  install -Dm644 "$srcdir/emposium/ru.emposium.app.desktop" "$pkgdir/usr/share/applications/ru.emposium.app.desktop"
  install -Dm644 "$srcdir/emposium/emposium.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/ru.emposium.app.png"
  install -Dm644 "$srcdir/emposium/THIRD-PARTY-NOTICES.txt" "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-NOTICES.txt"
  install -Dm644 "$srcdir/emposium/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
