# Maintainer: Light Ning <lightning1141@gmail.com>

pkgname=cproxy-bin
pkgver=4.3.1
pkgrel=1
pkgdesc="Easy per application transparent proxy built on cgroup, forked version."
url="https://github.com/light4/cproxy"
arch=(x86_64 aarch64)
license=(AGPL)
depends=(iptables iproute2)
provides=('cproxy')
conflicts=('cproxy')

source_x86_64=("https://github.com/light4/cproxy/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-x86_64-linux-gnu")
source_aarch64=("https://github.com/light4/cproxy/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-aarch64-linux-gnu")

sha256sums_x86_64=('5dca4b5340e241e978806692c144c9b6c1f379f1a981876eef29a75b509d18bf')
sha256sums_aarch64=('156eb8561db7354b0c110ae5eac0bd1b0df2f139f4305a4c6f12b69fe4a3a6d2')

package() {
  install -Dm4755 "${srcdir}/${pkgname/-bin/}-v${pkgver}-${CARCH}-linux-gnu" "$pkgdir/usr/bin/${pkgname/-bin/}"
}
