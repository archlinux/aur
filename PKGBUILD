# Maintainer: Manuel Schmitzberger <ms@ms-sw.at>

pkgname=vmutils
pkgver=1.71.0
pkgrel=1
pkgdesc="Victoria Metrics utils"
arch=('x86_64')
url="https://victoriametrics.github.io"
license=('Apache')
depends=('glibc')
makedepends=('go')
backup=('etc/default/victoriametrics')
source=("https://github.com/VictoriaMetrics/VictoriaMetrics/releases/download/v$pkgver/vmutils-amd64-v$pkgver.tar.gz")
b2sums=('c7e438adbb69c1fe72f19cc9ed6225feee82a1ac64314e80ea0734937ddaf946268119cb9b2ced6e59bc9857d2b23ec478d2a27a04d0fa5f7ce80668b8273823')

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
