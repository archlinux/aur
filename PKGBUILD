# Maintainer: Manuel Schmitzberger <ms@ms-sw.at>

pkgname=vmutils
pkgver=1.76.1
pkgrel=1
pkgdesc="Victoria Metrics utils"
arch=('x86_64')
url="https://victoriametrics.github.io"
license=('Apache')
depends=('glibc')
makedepends=('go')
backup=('etc/default/victoriametrics')
source=("https://github.com/VictoriaMetrics/VictoriaMetrics/releases/download/v$pkgver/vmutils-amd64-v$pkgver.tar.gz")
sha256sums=('f35f247cf670d6a633f665b58e1cfb052af48018ba4d25ee812ceb1ebbe697e1')

build() {
  # rename binaries
  mv "${srcdir}"/vmagent-prod "${srcdir}"/vmagent
  mv "${srcdir}"/vmalert-prod "${srcdir}"/vmalert
  mv "${srcdir}"/vmauth-prod "${srcdir}"/vmauth
  mv "${srcdir}"/vmbackup-prod "${srcdir}"/vmbackup
  mv "${srcdir}"/vmctl-prod "${srcdir}"/vmctl
  mv "${srcdir}"/vmrestore-prod "${srcdir}"/vmrestore
}

package() {
  install -Dm 755 "${srcdir}/"vmagent -t "${pkgdir}"/usr/bin/
  install -Dm 755 "${srcdir}/"vmalert -t "${pkgdir}"/usr/bin/
  install -Dm 755 "${srcdir}/"vmauth -t "${pkgdir}"/usr/bin/
  install -Dm 755 "${srcdir}/"vmbackup -t "${pkgdir}"/usr/bin/
  install -Dm 755 "${srcdir}/"vmctl -t "${pkgdir}"/usr/bin/
  install -Dm 755 "${srcdir}/"vmrestore -t "${pkgdir}"/usr/bin/
}
