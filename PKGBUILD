# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>
pkgname=grafana-pcp-bin
pkgver="5.1.1"
pkgrel=1
pkgdesc="Performance Co-Pilot Grafana Plugin"
url="https://github.com/performancecopilot/grafana-pcp"
arch=(x86_64)
license=(Apache-2.0)
depends=(grafana)
conflicts=(grafana-pcp)
provides=(grafana-pcp)
# the signature is invalid otherwise
options=(!strip)

source=("https://github.com/performancecopilot/grafana-pcp/releases/download/v${pkgver}/performancecopilot-pcp-app-${pkgver}.zip")
# add dummy entries for `make generate-checksums` to create SHA256 instead of MD5 check sums
sha256sums=("c5cb68df7b61c438d703def168da0c881073c64bb8d0c370b6f1a6510aca3351")

package() {
  install -dm750 $pkgdir/var/lib/grafana
  install -dm755 $pkgdir/var/lib/grafana/plugins
  cp -a $srcdir/performancecopilot-pcp-app $pkgdir/var/lib/grafana/plugins
}
