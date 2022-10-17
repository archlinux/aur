# Maintainer: A Frederick Christensen <aur@ivories.org>

pkgname=mautrix-wsproxy
pkgver=1.0.0
pkgrel=1
pkgdesc="A websocket proxy for Matrix appservices"
arch=('x86_64')
license=('AGPL')
makedepends=(go git)
url="https://github.com/mautrix/wsproxy"
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('17800afd4196d6759700ae8983b730ee9280fd60db84778eefaa29d47874d336')

build() {
  cd "${srcdir}/wsproxy-${pkgver}"
  go build -o "${pkgname}"
}

package() {
  cd "${srcdir}/wsproxy-${pkgver}"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
