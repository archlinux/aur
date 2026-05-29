# Maintainer: agony <27015 at riseup dot net>
pkgname=miniflux-bin
pkgver=2.3.1
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
sha256sums_x86_64=('fae4bb89c6e9d739cc1181da416a7924f7da98ff7c521dcd7a34cb20750327b5')
sha256sums_aarch64=('ae3e69a7c0d1f38c0353dabfbcec48eda342f0e8580585d7595256bee0fef1ee')
sha256sums_armv7h=('40afdf5d9a5566edc15f75a579a394a4bb5869fae24099b3a641223b1bc337b1')
sha256sums_armv6h=('05e80bd72251324ee129295ae716ca02d1546c8a147933f36aab6d31d4cdde62')
sha256sums_arm=('ea6253ddc98046e9aac9458a00aedd2866a32b9eaa6561dbc592064751f88231')

package() {
  install -Dm755 "miniflux-${pkgver}-${CARCH}" "$pkgdir/usr/bin/miniflux"
  install -Dm644 miniflux.service "$pkgdir/usr/lib/systemd/system/miniflux.service"
  install -Dm644 miniflux-sysusers.conf "$pkgdir/usr/lib/sysusers.d/miniflux.conf"
  install -Dm644 miniflux-tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/miniflux.conf"
  install -Dm600 miniflux.conf "$pkgdir/etc/miniflux.conf"
}
