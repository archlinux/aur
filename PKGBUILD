# Maintainer: agony <27015 at riseup dot net>
pkgname=miniflux-bin
pkgver=2.3.3
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
sha256sums_x86_64=('237bf0aed05e86c235b6bcfbad843bfc7bcdd6a628ece672eae3d1e013ddd244')
sha256sums_aarch64=('085e34797fcbc1e899f7b9f042228910af214d5c010d9ad4e6289e7fb5ca833c')
sha256sums_armv7h=('85c3a2662b56f329fe77bbab883b449d719f5b0e5746d3057e894f21ef7bb121')
sha256sums_armv6h=('ae29c1ca0f1d0b8bec7a5626fa08331b809f41f33cdecf137f2fdf1efac458b8')
sha256sums_arm=('edaa55097839f679978f90d75752393dcb4c64479db676b1ed62714eedad034e')

package() {
  install -Dm755 "miniflux-${pkgver}-${CARCH}" "$pkgdir/usr/bin/miniflux"
  install -Dm644 miniflux.service "$pkgdir/usr/lib/systemd/system/miniflux.service"
  install -Dm644 miniflux-sysusers.conf "$pkgdir/usr/lib/sysusers.d/miniflux.conf"
  install -Dm644 miniflux-tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/miniflux.conf"
  install -Dm600 miniflux.conf "$pkgdir/etc/miniflux.conf"
}
