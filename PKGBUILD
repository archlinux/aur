# Maintainer: Pauls Nartišs <paulsnar@paulsnar.lv>
pkgname=victorialogs-bin
pkgver=1.38.0
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
    'c3a93586e589fea8ab24926929a15f8d2785ac011bc00155615bbdb17a735079'
    '88aceedb5263aa0e3fa4a3631dbf1aae9ee60805e7c94278eb4097161333382b'
)
sha256sums_aarch64=(
    '7b02a93d9ff64b40731b917a2a03cbb53a494239fd109072605c53a3f571d31b'
    'f61d46e677c45be2d1c72558ad27f59bde519e1ebd733026676cef73e52b64f4'
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
