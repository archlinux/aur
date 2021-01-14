# Maintainer: Cédric Connes <cedric.connes@gmail.com>

pkgname=chisel-tunnel-bin
pkgver=1.7.4
pkgrel=1
pkgdesc="A fast TCP tunnel over HTTP"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/jpillora/chisel"
license=('MIT')
provides=('chisel-tunnel')
conflicts=('chisel-tunnel')
source=("README_${pkgver}.md::https://raw.githubusercontent.com/jpillora/chisel/v$pkgver/README.md"
        "users_${pkgver}.json::https://raw.githubusercontent.com/jpillora/chisel/v$pkgver/example/users.json"
	"LICENSE_${pkgver}::https://raw.githubusercontent.com/jpillora/chisel/v$pkgver/LICENSE")
source_i686=("chisel_${pkgver}_i686.gz::https://github.com/jpillora/chisel/releases/download/v$pkgver/chisel_${pkgver}_linux_386.gz")
source_x86_64=("chisel_${pkgver}_x86_64.gz::https://github.com/jpillora/chisel/releases/download/v$pkgver/chisel_${pkgver}_linux_amd64.gz")
source_armv6h=("chisel_${pkgver}_armv6h.gz::https://github.com/jpillora/chisel/releases/download/v$pkgver/chisel_${pkgver}_linux_armv6.gz")
source_armv7h=("chisel_${pkgver}_armv7h.gz::https://github.com/jpillora/chisel/releases/download/v$pkgver/chisel_${pkgver}_linux_armv7.gz")
source_aarch64=("chisel_${pkgver}_aarch64.gz::https://github.com/jpillora/chisel/releases/download/v$pkgver/chisel_${pkgver}_linux_arm64.gz")
sha256sums=('04f71edb45d72e8da8fa1748d1dc53109f375ba0fce4f133b0e7a0a33c01954b'
            'b3cb23ef88fcf4f39ee057289e7d2a92a03b2f33ec05caa4d70cd15a2ca60acd'
            '1edfe3540212ff667e460e212b31178e405139fdff18d643bdd49b05623ac3ac')
sha256sums_i686=('00393218120b164c3069439284c49edd5a99be83482ed9149ce9af0e8026e61a')
sha256sums_x86_64=('14ed05af8630a01f953eee94967bf1e6a322819bf404b451038f8aacbde5569b')
sha256sums_armv6h=('c4c624294090555e88aff480bc19f55ffcd1b51dda2dbf55fe35dde60b374fd1')
sha256sums_armv7h=('5859e420b588764f0d8d5e301439af524ef486d1d39b0a189d93546cacf51d7d')
sha256sums_aarch64=('418c8a25e997241471590accb65f6e6727cd6f62d05f11c2a3b3b9667e39383b')

package() {
  install -D -m755 "chisel_${pkgver}_$CARCH" "$pkgdir/usr/bin/chisel"
  install -D -m644 "README_${pkgver}.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -D -m644 "users_${pkgver}.json" "$pkgdir/usr/share/doc/$pkgname/users.json"
  install -D -m644 "LICENSE_${pkgver}" "$pkgdir/usr/share/doc/$pkgname/LICENSE"
}
