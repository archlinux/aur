# Maintainer: Antoine Lubineau <antoine@lubignon.info>
pkgname=tcpulse
pkgver=0.9.0
pkgrel=1
pkgdesc="A TCP/UDP load generator that provides fine-grained, flow-level control in Go"
arch=('x86_64')
url="https://github.com/yuuki/tcpulse"
license=('Apache-2.0')
makedepends=('git' 'go')
source=("${pkgname}::git+${url}#tag=v${pkgver}")
b2sums=('0c4ff8c500f45b3f7bff6e8ff9bf7dd813ef4a4c5daa906899a8e96d3868259f16d95811a1c68d83e15cf11dc45f3892830755606e2b099a13c344af2bf05123')

build() {
  cd "${srcdir}/${pkgname}"
  go build -o tcpulse .
}

package() {
  install -D -m 0755 -t "${pkgdir}/usr/bin" "${srcdir}/${pkgname}/${pkgname}"
}
