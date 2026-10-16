# Maintainer: pantarune

pkgname=niri-screenshare
pkgver=0.2.3
pkgrel=2
pkgdesc="Portal backend for niri implementing ScreenCast (prebuilt binary)"
arch=('x86_64')
url="https://github.com/pantarune/niri-screenshare"
license=('GPL3')
depends=('xdg-desktop-portal' 'pipewire' 'niri' 'gtk4' 'libadwaita')
source=("niri-screenshare-v${pkgver}-linux-x86_64.tar.gz::https://github.com/pantarune/niri-screenshare/releases/download/v${pkgver}/niri-screenshare-v${pkgver}-linux-x86_64.tar.gz"
        "niri-screenshare-${pkgver}-sources.tar.gz::https://github.com/pantarune/niri-screenshare/archive/v${pkgver}.tar.gz")
sha256sums=('7a70b1ee7ed5ab5dd75d3e3ef26d1618a477d8eebabd0bfdb06ba086fa626e74'
            'f99f56b716a0681654f00f2ff1e8843b34155da191ec059b95cc88f0e7cf576c')

package() {
  install -Dm755 "$srcdir/niri-screenshare" "$pkgdir/usr/lib/niri-screenshare"
  install -Dm644 "$srcdir/niri-screenshare-$pkgver/data/niri.portal" "$pkgdir/usr/share/xdg-desktop-portal/portals/niri.portal"
  install -Dm644 "$srcdir/niri-screenshare-$pkgver/data/org.freedesktop.impl.portal.desktop.niri.service" "$pkgdir/usr/share/dbus-1/services/org.freedesktop.impl.portal.desktop.niri.service"
  install -Dm644 "$srcdir/niri-screenshare-$pkgver/data/niri-screenshare.service" "$pkgdir/usr/lib/systemd/user/niri-screenshare.service"
}
