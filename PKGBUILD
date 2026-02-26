pkgname=mic-indicator-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="PipeWire microphone tray indicator. Pre-compiled."
arch=('x86_64')
url="https://github.com/lincot/mic-indicator"
license=('GPL-3.0-only')
depends=('qt6-base' 'pipewire')
provides=('mic-indicator')
conflicts=('mic-indicator')
source=("https://github.com/lincot/mic-indicator/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}.tar.gz")
sha256sums=('1c6d62363606b21887af2ebc04db75f63cd0685c625310db51ca4561b69ab4b7')

package() {
  cd "$srcdir"
  
  install -Dm755 "build/mic-indicator" "$pkgdir/usr/bin/mic-indicator"

  for status in off low high; do
    install -Dm644 "res/icons/mic-indicator-$status.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/mic-indicator-$status.png"
  done
}
