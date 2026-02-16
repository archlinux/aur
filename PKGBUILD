pkgname=monitor-switch-host-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="WebSocket server for switching monitor inputs via DDC/CI"
arch=('x86_64')
url="https://github.com/jasval/monitor-switch-host-releases"
license=('MIT')
depends=('avahi' 'gtk3' 'libayatana-appindicator' 'xdotool')
provides=('monitor-switch-host')
conflicts=('monitor-switch-host')
source=("https://github.com/jasval/monitor-switch-host-releases/releases/download/v${pkgver}/monitor_switch_host-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('61efa6085d7cb4b4b4e190d7b45a622af8ed5bc1654d46ab7b8f267f8bfa6bde')

package() {
  install -Dm755 "${srcdir}/monitor_switch_host" "${pkgdir}/usr/local/bin/monitor_switch_host"
  install -Dm644 "${srcdir}/monitor-switch-host.service" "${pkgdir}/usr/lib/systemd/user/monitor-switch-host.service"
}
