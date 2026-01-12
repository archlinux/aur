# Maintainer: Antoine Lubineau <antoine@lubignon.info>
pkgname=tcpulse
pkgver=0.8.3
pkgrel=1
pkgdesc="A TCP/UDP load generator that provides fine-grained, flow-level control in Go"
arch=('x86_64')
url="https://github.com/yuuki/tcpulse"
license=('Apache-2.0')
makedepends=('git' 'go')
source=("${pkgname}::git+${url}#tag=v${pkgver}")
b2sums=('2f4f3397a937c0705868e8674d3f7a3192b37c1e6e81388136e7881665fb1dd42c7317baf84d62ad49ba84cdd115a9149e0d565e260018d0ae07cc74b706fd10')

build() {
  cd "${srcdir}/${pkgname}"
  go build -o tcpulse .
}

package() {
  install -D -m 0755 -t "${pkgdir}/usr/bin" "${srcdir}/${pkgname}/${pkgname}"
}
