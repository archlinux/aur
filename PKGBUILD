# Maintainer: agony <27015 at riseup dot net>
pkgname=miniflux-bin
pkgver=2.2.19
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
sha256sums_x86_64=('aa48d388e4871a7b79ed33c524426a3b87cf04e8386e53edd00cf6b63c1ab7b0')
sha256sums_aarch64=('e29746debd4a472e1412813080a6b017879669814ef3f2e2453c95e29b683a1c')
sha256sums_armv7h=('911ac932e35fd808fa6e483e55537a1ef5e77cd9ef24d0cc8ea3cf8b8afba666')
sha256sums_armv6h=('81468cbe6564f70298e511ebdc69dfd37066ed294d8e39650a194f5ac3b44801')
sha256sums_arm=('b69fb740d9f641a90806db76a2aab73a5982cf65f9b82878876b5a586d00908b')

package() {
  install -Dm755 "miniflux-${pkgver}-${CARCH}" "$pkgdir/usr/bin/miniflux"
  install -Dm644 miniflux.service "$pkgdir/usr/lib/systemd/system/miniflux.service"
  install -Dm644 miniflux-sysusers.conf "$pkgdir/usr/lib/sysusers.d/miniflux.conf"
  install -Dm644 miniflux-tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/miniflux.conf"
  install -Dm600 miniflux.conf "$pkgdir/etc/miniflux.conf"
}
