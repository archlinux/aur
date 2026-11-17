# Maintainer: Antoine Lubineau <antoine@lubignon.info>
pkgname=tcpulse
pkgver=0.9.1
pkgrel=1
pkgdesc="A TCP/UDP load generator that provides fine-grained, flow-level control in Go"
arch=('x86_64')
url="https://github.com/yuuki/tcpulse"
license=('Apache-2.0')
makedepends=('git' 'go')
source=("${pkgname}::git+${url}#tag=v${pkgver}")
b2sums=('3c583d8f7fda3a40b6c8e8e2c9b59f395747bb6a7d776f7d0780854289050789a9e2e41ae0929e36014778978a9a460925d8cf59d83f3d9e4218476e4f239b58')

build() {
  cd "${srcdir}/${pkgname}"
  go build -o tcpulse .
}

package() {
  install -D -m 0755 -t "${pkgdir}/usr/bin" "${srcdir}/${pkgname}/${pkgname}"
}
