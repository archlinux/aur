# Maintainer: Manuel Schmitzberger <ms@ms-sw.at>
# Co-maintainer: Pauls Nartišs <paulsnar@paulsnar.lv>

pkgname=vmutils
pkgver=1.152.0
pkgrel=1
pkgdesc="VictoriaMetrics utils"
arch=('x86_64' 'aarch64')
url="https://docs.victoriametrics.com/victoriametrics/"
license=('Apache-2.0')
source_x86_64=("https://github.com/VictoriaMetrics/VictoriaMetrics/releases/download/v$pkgver/vmutils-linux-amd64-v$pkgver.tar.gz")
source_aarch64=("https://github.com/VictoriaMetrics/VictoriaMetrics/releases/download/v$pkgver/vmutils-linux-arm64-v$pkgver.tar.gz")
sha256sums_x86_64=('8eee4a98ff1665c60682475e8a8b292b8d718b63a2f023124384dd2f6a220c79')
sha256sums_aarch64=('57c567b262962a4cb8e35c0c34efe64629a3e1ea69ac0611d8d67e168df8b1e8')

build() {
  # rename binaries
  mv "${srcdir}"/vmagent-prod "${srcdir}"/vmagent
  mv "${srcdir}"/vmalert-prod "${srcdir}"/vmalert
  mv "${srcdir}"/vmalert-tool-prod "${srcdir}"/vmalert-tool
  mv "${srcdir}"/vmauth-prod "${srcdir}"/vmauth
  mv "${srcdir}"/vmbackup-prod "${srcdir}"/vmbackup
  mv "${srcdir}"/vmctl-prod "${srcdir}"/vmctl
  mv "${srcdir}"/vmrestore-prod "${srcdir}"/vmrestore
}

package() {
  install -Dm 755 "${srcdir}/"vmagent -t "${pkgdir}"/usr/bin/
  install -Dm 755 "${srcdir}/"vmalert -t "${pkgdir}"/usr/bin/
  install -Dm 755 "${srcdir}/"vmalert-tool -t "${pkgdir}"/usr/bin/
  install -Dm 755 "${srcdir}/"vmauth -t "${pkgdir}"/usr/bin/
  install -Dm 755 "${srcdir}/"vmbackup -t "${pkgdir}"/usr/bin/
  install -Dm 755 "${srcdir}/"vmctl -t "${pkgdir}"/usr/bin/
  install -Dm 755 "${srcdir}/"vmrestore -t "${pkgdir}"/usr/bin/
}
