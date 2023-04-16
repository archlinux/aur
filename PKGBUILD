# Maintainer: Light Ning <lightning1141@gmail.com>

pkgname=cproxy-bin
pkgver=4.3.3
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

sha256sums_x86_64=('af2ccc26fa0b4fa51f2fc24dbd3d097a3fd324edf1f59774e82ef36579fdbf52')
sha256sums_aarch64=('51ae015daed9bce779641737854cc194189ff020c009295f5356fb5d576f0c01')

package() {
  install -Dm4755 "${srcdir}/${pkgname/-bin/}-v${pkgver}-${CARCH}-linux-gnu" "$pkgdir/usr/bin/${pkgname/-bin/}"
}
