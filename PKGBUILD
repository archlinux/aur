# Maintainer: agony <27015 at riseup dot net>
pkgname=miniflux-bin
pkgver=2.2.18
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
sha256sums_x86_64=('29f1e871ac87d72125682c4ffafa1e446a84e806d3f4ed616aacf431ed8c3607')
sha256sums_aarch64=('4eb95103bf1b79a1abe0ee1ad853b6252818592906522f7f73430dcabbcbd13a')
sha256sums_armv7h=('77084fcf9efd760a6e7e2f78d90906772c35eba29001ec7d04a12d56dd4cc21a')
sha256sums_armv6h=('0abe763a62829ba43d03dfb96d1d82618197691959f111ad2b697244633baf3b')
sha256sums_arm=('714d2dbc2aa3383f929ca89a1cc8f16d66693d2640732e05c2a7136672a5dc9b')

package() {
  install -Dm755 "miniflux-${pkgver}-${CARCH}" "$pkgdir/usr/bin/miniflux"
  install -Dm644 miniflux.service "$pkgdir/usr/lib/systemd/system/miniflux.service"
  install -Dm644 miniflux-sysusers.conf "$pkgdir/usr/lib/sysusers.d/miniflux.conf"
  install -Dm644 miniflux-tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/miniflux.conf"
  install -Dm600 miniflux.conf "$pkgdir/etc/miniflux.conf"
}
