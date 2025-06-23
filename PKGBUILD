# Maintainer: Pauls Nartišs <paulsnar@paulsnar.lv>
pkgname=victorialogs-bin
pkgver=1.24.0
pkgrel=1
pkgdesc="Scalable logging solution designed to be fast and highly efficient"
arch=('x86_64')
url="https://docs.victoriametrics.com/victorialogs/"
license=('Apache-2.0')
backup=('etc/default/victorialogs')
source=("service" "sysusers" "tmpfiles" "default")
source_x86_64=(
    "https://github.com/VictoriaMetrics/VictoriaMetrics/releases/download/v${pkgver}-victorialogs/victoria-logs-linux-amd64-v${pkgver}-victorialogs.tar.gz"
    "https://github.com/VictoriaMetrics/VictoriaMetrics/releases/download/v${pkgver}-victorialogs/vlogscli-linux-amd64-v${pkgver}-victorialogs.tar.gz"
)
source_aarch64=(
    "https://github.com/VictoriaMetrics/VictoriaMetrics/releases/download/v${pkgver}-victorialogs/victoria-logs-linux-arm64-v${pkgver}-victorialogs.tar.gz"
    "https://github.com/VictoriaMetrics/VictoriaMetrics/releases/download/v${pkgver}-victorialogs/vlogscli-linux-arm64-v${pkgver}-victorialogs.tar.gz"
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')
sha256sums_x86_64=(
    '9b956336f9f44804e87329f891e31483aa9367dafb249c124b40e8b88bc0e28c'
    '617bf09485682d11c7601d11310b5d6d409b301861807b74e3b94950971ba3ff'
)
sha256sums_aarch64=(
    '319b4e0d26c6dcd98afdd53a7f05df65677689b080e7e2b75d12bca5d0b3f43d'
    '617bf09485682d11c7601d11310b5d6d409b301861807b74e3b94950971ba3ff'
)

package(){
  install -Dm755 "${srcdir}/victoria-logs-prod" "${pkgdir}/usr/bin/victorialogs"
  install -Dm755 "${srcdir}/vlogscli-prod" "${pkgdir}/usr/bin/vlogscli"
  install -Dm640 "${srcdir}/service" "${pkgdir}/usr/lib/systemd/system/victorialogs.service"
  install -Dm640 "${srcdir}/default" "${pkgdir}/etc/default/victorialogs"
  install -Dm644 "${srcdir}/sysusers" "${pkgdir}/usr/lib/sysusers.d/victorialogs.conf"
  install -Dm644 "${srcdir}/tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/victorialogs.conf"
}
