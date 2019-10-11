# Maintainer: navigaid <navigaid@gmail.com>
pkgname=grafterm
pkgver=0.2.0
pkgrel=1
pkgdesc='Metrics dashboards on terminal (a grafana inspired terminal version)'
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/slok/grafterm'
license=('Apache')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/slok/grafterm/archive/v${pkgver}.tar.gz")
md5sums=('1d70552f7304335092679e69a18af44f')

build() {
  cd ${pkgname}-${pkgver}
  go1.13 build ./cmd/${pkgname}
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 Readme.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=2 sw=2 et:
