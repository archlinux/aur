# Maintainer: Pauls Nartišs <paulsnar@paulsnar.lv>
pkgname=victorialogs-bin
pkgver=1.47.0
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
    '4d212c081adc580168274c829a0e4cf888a04f438b3e2ee1f1eeb00010967f32'
    '56c3412430b47f8c45416a8f87460c8ac25a109d9b9f8de4928211a78db01e46'
)
sha256sums_aarch64=(
    '12ffcd0363a999532da67f0b86fe5b669226b08f2abac8f56e896727d07bfd33'
    '2fe1c577b0664af9d2469f658e1a9bc7ddc3180bf3b47eb9ce054d2eb7f3fc9c'
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
