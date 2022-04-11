# Maintainer: Ivan  <vantu5z@mail.ru>

pkgname=wireproxy
pkgver=1.0.3
pkgrel=1
arch=(x86_64)
license=(ISC)
url="https://github.com/octeep/wireproxy"
pkgdesc="Wireguard client that exposes itself as a socks5 proxy"
depends=()
makedepends=('go')

source=("https://github.com/octeep/wireproxy/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('108175bff7e5158236acdd2a0b1fc129a799a52772885b8e835c5e84d24a7358')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  go build ./cmd/wireproxy
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm0755 "wireproxy" "${pkgdir}/usr/bin/wireproxy"
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
