# Maintainer: Antoine Lubineau <antoine@lubignon.info>
pkgname=tcpulse
pkgver=0.8.2
pkgrel=1
pkgdesc="A TCP/UDP load generator that provides fine-grained, flow-level control in Go"
arch=('x86_64')
url="https://github.com/yuuki/tcpulse"
license=('Apache-2.0')
makedepends=('git' 'go')
source=("${pkgname}-${pkgver}::git+${url}#tag=v${pkgver}")
b2sums=('01e548712a5b4216f87b62ea7df0dcc0ad6d8fabed4e9923e45435f2112f5391d7a4547282c7ec41a9a8ad25f114f0829ccb8d79934f9886d431a11a5f01eaa7')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  go build -o tcpulse .
}

package() {
  install -D -m 0755 -t "${pkgdir}/usr/bin" "${srcdir}/${pkgname}-${pkgver}/${pkgname}"
}
