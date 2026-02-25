pkgname=monitor-switch-host-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="WebSocket server for switching monitor inputs via DDC/CI"
arch=('x86_64')
url="https://github.com/jasval/monitor-switch-host-releases"
license=('MIT')
depends=('avahi' 'gtk3' 'libayatana-appindicator' 'xdotool')
provides=('monitor-switch-host')
conflicts=('monitor-switch-host')
source=("https://github.com/jasval/monitor-switch-host-releases/releases/download/v${pkgver}/monitor_switch_host-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('fac9d60b2a036641dff8cd5c8233632772ac61292879a2e7e4b6c50d696e9fb1')

package() {
  install -Dm755 "${srcdir}/monitor_switch_host" "${pkgdir}/usr/local/bin/monitor_switch_host"
  install -Dm644 "${srcdir}/monitor-switch-host.service" "${pkgdir}/usr/lib/systemd/user/monitor-switch-host.service"
}
