pkgname=mic-indicator-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="PipeWire microphone tray indicator. Pre-compiled."
arch=('x86_64')
url="https://github.com/lincot/mic-indicator"
license=('GPL-3.0-only')
depends=('qt6-base' 'pipewire')
provides=('mic-indicator')
conflicts=('mic-indicator')
source=("https://github.com/lincot/mic-indicator/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}.tar.gz")
sha256sums=('e320e2e44198b684bf2e0ac17be93cb7a8755b7dbf87401c316ebd55d55036eb')

package() {
  cd "$srcdir"
  
  install -Dm755 "build/mic-indicator" "$pkgdir/usr/bin/mic-indicator"

  for status in off low high; do
    install -Dm644 "res/icons/mic-indicator-$status.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/mic-indicator-$status.png"
  done
}
