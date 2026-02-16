pkgname=monitor-switch-host-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="WebSocket server for switching monitor inputs via DDC/CI"
arch=('x86_64')
url="https://github.com/jasval/monitor-switch-host-releases"
license=('MIT')
depends=('avahi' 'gtk3' 'libayatana-appindicator' 'xdotool')
provides=('monitor-switch-host')
conflicts=('monitor-switch-host')
source=("https://github.com/jasval/monitor-switch-host-releases/releases/download/v${pkgver}/monitor_switch_host-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('baff405a3b0b67046e4a40da2976890b876d1842569373958d745fb646d9f4f0')

package() {
  install -Dm755 "${srcdir}/monitor_switch_host" "${pkgdir}/usr/local/bin/monitor_switch_host"
  install -Dm644 "${srcdir}/monitor-switch-host.service" "${pkgdir}/usr/lib/systemd/user/monitor-switch-host.service"
}
