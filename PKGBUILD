# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=gotags
pkgver=1.4.1
pkgrel=1
pkgdesc='ctags-compatible tag generator for Go'
arch=('any')
url='https://github.com/jstemmer/gotags'
license=('MIT')
makedepends=('go-pie')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('2df379527eaa7af568734bc4174febe7752eb5af1b6194da84cd098b7c873343')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOCACHE="${srcdir}/${pkgname}-${pkgver}/gocache"
  go build -o "${pkgname}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
