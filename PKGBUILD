# Maintainer: Light Ning <lightning1141@gmail.com>

pkgname=cproxy-bin
pkgver=4.3.2
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

sha256sums_x86_64=('aaee96c0a86d5e1b2af509d7f6dd104bea42bd5b0f21f8e8f0c6ae9136b5d781')
sha256sums_aarch64=('770e5ef0750051bae61e52148e59fa204d3920f54c5d00783388149910590bef')

package() {
  install -Dm4755 "${srcdir}/${pkgname/-bin/}-v${pkgver}-${CARCH}-linux-gnu" "$pkgdir/usr/bin/${pkgname/-bin/}"
}
