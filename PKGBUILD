# Maintainer: jim3692 <jim3692 at gmail.com>
pkgname="pipewire-screenaudio"
pkgver=0.3.2
pkgrel=1
pkgdesc="Extension to passthrough pipewire audio to WebRTC Screenshare"
arch=('x86_64')
url="https://github.com/IceDBorn/pipewire-screenaudio"
license=('GPL3')
depends=(
  'util-linux'
  'gawk'
  'jq'
  'pipewire'
  )
options=(!lto)
conflicts=()
provides=('pipewire-screenaudio')
source=(
  "git+https://github.com/IceDBorn/pipewire-screenaudio.git#commit=0b085a8c8c7656dc1be1040256dd0009e0766e8f"
  )
sha256sums=(
  'SKIP'
  )

package() {
  install -Dm644 "$srcdir/pipewire-screenaudio/native/native-messaging-hosts/firefox.json" "$pkgdir/usr/lib/mozilla/native-messaging-hosts/com.icedborn.pipewirescreenaudioconnector.json"
  install -Dm755 "$srcdir/pipewire-screenaudio/native/connector/connect-and-monitor.sh" "$pkgdir/usr/lib/pipewire-screenaudio/connector/connect-and-monitor.sh"
  install -Dm755 "$srcdir/pipewire-screenaudio/native/connector/pipewire-screen-audio-connector.sh" "$pkgdir/usr/lib/pipewire-screenaudio/connector/pipewire-screen-audio-connector.sh"
  install -Dm755 "$srcdir/pipewire-screenaudio/native/connector/virtmic.sh" "$pkgdir/usr/lib/pipewire-screenaudio/connector/virtmic.sh"
}
