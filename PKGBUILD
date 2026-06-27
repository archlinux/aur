# Maintainer: agony <27015 at riseup dot net>
pkgname=miniflux-bin
pkgver=2.3.2
pkgrel=1
pkgdesc="Minimalist and opinionated feed reader"
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h' 'arm')
url="https://miniflux.app"
license=('Apache-2.0')
depends=('glibc')
optdepends=('postgresql: required database backend')
provides=('miniflux')
conflicts=('miniflux' 'miniflux-git')
install=$pkgname.install
backup=('etc/miniflux.conf')
source=("miniflux.service"
        "miniflux-sysusers.conf"
        "miniflux-tmpfiles.conf"
        "miniflux.conf")
source_x86_64=("miniflux-${pkgver}-x86_64::https://github.com/miniflux/v2/releases/download/${pkgver}/miniflux-linux-amd64")
source_aarch64=("miniflux-${pkgver}-aarch64::https://github.com/miniflux/v2/releases/download/${pkgver}/miniflux-linux-arm64")
source_armv7h=("miniflux-${pkgver}-armv7h::https://github.com/miniflux/v2/releases/download/${pkgver}/miniflux-linux-armv7")
source_armv6h=("miniflux-${pkgver}-armv6h::https://github.com/miniflux/v2/releases/download/${pkgver}/miniflux-linux-armv6")
source_arm=("miniflux-${pkgver}-arm::https://github.com/miniflux/v2/releases/download/${pkgver}/miniflux-linux-armv5")
sha256sums=('e5b7caf1de3e63ad1a290664cbde4d672fc1676ede8d8465baf78acd58a59803'
            '41fc7ee4e9f5567b8aa01f37fd8373a24b23248bd69ba3add909c9486379f12e'
            '6f2d286bd8b365abf4d345e53c9cb2b0852baf04627161f042d6d19561332fdd'
            'a371eddd79eb1dfe8aecde2bde7b55972b019c26d148ffba97b8d0a04677841d')
sha256sums_x86_64=('42db4484d87d045a3e2f99f90d211a210ea3d623a5f08dffa81ffb4dc9467f69')
sha256sums_aarch64=('c79814365cfcaa8062c28e2d4ce66a275bd388d98e970ae021ffb4cfe2c84b25')
sha256sums_armv7h=('ec272fef3050807db45133e23f2646576ab38d8125c191be45163007b12f2214')
sha256sums_armv6h=('e40dc6c708f590f998cbae7bdb6cb3815dc2cef9b6c67813a8190569f2be94b6')
sha256sums_arm=('ce5df411082e2ce91ec9d8580d0bc241a048f77e93aa307eade1e5062fbe1588')

package() {
  install -Dm755 "miniflux-${pkgver}-${CARCH}" "$pkgdir/usr/bin/miniflux"
  install -Dm644 miniflux.service "$pkgdir/usr/lib/systemd/system/miniflux.service"
  install -Dm644 miniflux-sysusers.conf "$pkgdir/usr/lib/sysusers.d/miniflux.conf"
  install -Dm644 miniflux-tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/miniflux.conf"
  install -Dm600 miniflux.conf "$pkgdir/etc/miniflux.conf"
}
