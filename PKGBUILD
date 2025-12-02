# Maintainer: Manuel Schmitzberger <ms@ms-sw.at>
# Co-maintainer: Pauls Nartišs <paulsnar@paulsnar.lv>

pkgname=vmutils
pkgver=1.131.0
pkgrel=1
pkgdesc="Victoria Metrics utils"
arch=('x86_64')
url="https://docs.victoriametrics.com/victoriametrics/"
license=('Apache-2.0')
source=("https://github.com/VictoriaMetrics/VictoriaMetrics/releases/download/v$pkgver/vmutils-linux-amd64-v$pkgver.tar.gz")
sha256sums=('0b96b117acf836a81a5f2dac5373c9c6ade19ed797edd3dacc42ee123d199e47')

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
