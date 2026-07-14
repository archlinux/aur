# Maintainer: Carmine Paolino <carmine@paolino.me>
pkgname=mqtt-alive-daemon
pkgver=0.4.0
pkgrel=1
pkgdesc="Reports machine aliveness and custom command checks to Home Assistant via MQTT"
arch=('x86_64' 'aarch64')
url="https://github.com/crmne/mqtt-alive-daemon"
license=('MIT')
install="${pkgname}.install"
depends=('bash')
optdepends=('systemd: run as a system service')
conflicts=('mqtt-alive-daemon-git')
options=('!debug' '!strip')
source_x86_64=("${url}/releases/download/v${pkgver}/mqtt-alive-daemon_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/mqtt-alive-daemon_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('ac596f085425ac707b249ac823f0bf68e6a87e85f9e23cf04e406d967a2d5133')
sha256sums_aarch64=('2d1e480acfd3222a08bc32bf058feeb784e71ab63339391c5cd6af8c6ed1a99b')

package() {
  install -Dm755 "${srcdir}/mqtt-alive-daemon" "${pkgdir}/usr/bin/mqtt-alive-daemon"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/config.yaml.example" "${pkgdir}/etc/mqtt-alive-daemon/config.yaml.example"
  install -Dm644 "${srcdir}/packaging/systemd/mqtt-alive-daemon.service" "${pkgdir}/usr/lib/systemd/system/mqtt-alive-daemon.service"
}
