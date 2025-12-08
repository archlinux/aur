# Maintainer: Pauls Nartišs <paulsnar@paulsnar.lv>
pkgname=victorialogs-bin
pkgver=1.40.0
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
    'bdc657cdc1da0db8c91e3589e8d6f629179c9c2bc5684416550989849c82bf4d'
    '818500e5979bfed3d64ec7f51922ceb7b80856223bb578cc23d6a41d306d2e59'
)
sha256sums_aarch64=(
    'bc1a96688b81bd2d6d31e054e284229bf4eccf95d1b908bade84639811722f38'
    'b496782a12fd69b200fba6bd110983bbb434e6d7b46d39f2f784cb23201131e2'
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
