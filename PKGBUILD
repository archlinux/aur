# Maintainer: Light Ning <lightning1141@gmail.com>

pkgname=cproxy-bin
pkgver=4.3.4
pkgrel=0
pkgdesc="Easy per application transparent proxy built on cgroup, forked version."
url="https://github.com/light4/cproxy"
arch=(x86_64 aarch64)
license=(AGPL)
depends=(iptables iproute2)
provides=('cproxy')
conflicts=('cproxy')

source_x86_64=("https://github.com/light4/cproxy/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-x86_64-linux-gnu")
source_aarch64=("https://github.com/light4/cproxy/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-aarch64-linux-gnu")

sha256sums_x86_64=('bd8c92a129d96a20be6dc920c60f2b809f54ff11be1c610e6d745f53be9f41d5')
sha256sums_aarch64=('b78732418cf55bff1d0bff3123607c202e63c80c2161abecd00b54520246a748')

package() {
  install -Dm4755 "${srcdir}/${pkgname/-bin/}-v${pkgver}-${CARCH}-linux-gnu" "$pkgdir/usr/bin/${pkgname/-bin/}"
}
