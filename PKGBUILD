# Maintainer: Pauls Nartišs <paulsnar@paulsnar.lv>
pkgname=victorialogs-bin
pkgver=1.32.0
pkgrel=1
pkgdesc="Scalable logging solution designed to be fast and highly efficient"
arch=('x86_64' 'aarch64')
url="https://docs.victoriametrics.com/victorialogs/"
license=('Apache-2.0')
backup=('etc/default/victorialogs')
source=("service" "sysusers" "tmpfiles" "default")
source_x86_64=(
    "https://github.com/VictoriaMetrics/VictoriaLogs/releases/download/v${pkgver}/victoria-logs-linux-amd64-v${pkgver}.tar.gz"
    "https://github.com/VictoriaMetrics/VictoriaLogs/releases/download/v${pkgver}/vlutils-linux-amd64-v${pkgver}.tar.gz"
)
source_aarch64=(
    "https://github.com/VictoriaMetrics/VictoriaLogs/releases/download/v${pkgver}/victoria-logs-linux-arm64-v${pkgver}.tar.gz"
    "https://github.com/VictoriaMetrics/VictoriaLogs/releases/download/v${pkgver}/vlutils-linux-arm64-v${pkgver}.tar.gz"
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')
sha256sums_x86_64=(
    'ecff041c4e2e0041dcdbf7eda99a508ddcc939b782876102815c51fb6d6d057d'
    '173f70cc2356bbf71ccabb6be697f363a88e43daf929b5191dafd2585e763415'
)
sha256sums_aarch64=(
    'd5b4cb01536c24c80aef2092a44e6c2fad32d51f29a038321318d7b91002dc42'
    '27ac7d6fb43510f020dee3b47bc918e777e7056faf4c8c5b4f22a7a98d4c822e'
)

package(){
  install -Dm755 "${srcdir}/victoria-logs-prod" "${pkgdir}/usr/bin/victorialogs"
  install -Dm755 "${srcdir}/vlogscli-prod" "${pkgdir}/usr/bin/vlogscli"
  install -Dm755 "${srcdir}/vlagent-prod" "${pkgdir}/usr/bin/vlagent"
  install -Dm644 "${srcdir}/service" "${pkgdir}/usr/lib/systemd/system/victorialogs.service"
  install -Dm640 "${srcdir}/default" "${pkgdir}/etc/default/victorialogs"
  install -Dm644 "${srcdir}/sysusers" "${pkgdir}/usr/lib/sysusers.d/victorialogs.conf"
  install -Dm644 "${srcdir}/tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/victorialogs.conf"
}
