# Maintainer: Antoine Lubineau <antoine@lubignon.info>
pkgname=tcpulse
pkgver=0.8.2
_commit=39ebe8cade928f36d4bd938089f0dc550600c129
pkgrel=1
pkgdesc="A TCP/UDP load generator that provides fine-grained, flow-level control in Go"
arch=('x86_64')
url="https://github.com/yuuki/tcpulse"
license=('Apache-2.0')
makedepends=('git' 'go')
source=("git::git+${url}#commit=${_commit}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/git"
  go build -o tcpulse .
}

package() {
  install -D -m 0755 -t "${pkgdir}/usr/bin" "$srcdir/git/${pkgname}"
}
