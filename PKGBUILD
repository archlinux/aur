# Maintainer: Manuel Schmitzberger <ms@ms-sw.at>
# Co-maintainer: Pauls Nartišs <paulsnar@paulsnar.lv>

pkgname=vmutils
pkgver=1.130.0
pkgrel=1
pkgdesc="Victoria Metrics utils"
arch=('x86_64')
url="https://docs.victoriametrics.com/victoriametrics/"
license=('Apache-2.0')
source=("https://github.com/VictoriaMetrics/VictoriaMetrics/releases/download/v$pkgver/vmutils-linux-amd64-v$pkgver.tar.gz")
sha256sums=('1c9d28b933099b19022bda125421a986c3e8ccb79f4b5cb4ca9fc5acad2d840b')

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
