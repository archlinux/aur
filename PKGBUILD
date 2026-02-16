pkgname=monitor-switch-host-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="WebSocket server for switching monitor inputs via DDC/CI"
arch=('x86_64')
url="https://github.com/jasval/monitor-switch-host-releases"
license=('MIT')
depends=('avahi' 'gtk3' 'libayatana-appindicator' 'xdotool')
provides=('monitor-switch-host')
conflicts=('monitor-switch-host')
source=("https://github.com/jasval/monitor-switch-host-releases/releases/download/v${pkgver}/monitor_switch_host-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('6185abdfc3765177dba427dc4d15bb4a6283c9e55689f6912defdffcff94e29d')

package() {
  install -Dm755 "${srcdir}/monitor_switch_host" "${pkgdir}/usr/local/bin/monitor_switch_host"
  install -Dm644 "${srcdir}/monitor-switch-host.service" "${pkgdir}/usr/lib/systemd/user/monitor-switch-host.service"
}
