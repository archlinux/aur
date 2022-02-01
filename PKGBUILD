# Maintainer: Cédric Connes <cedric.connes@gmail.com>

pkgname=chisel-tunnel-bin
pkgver=1.7.7
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
sha256sums=('aaaff6c587839275b9fc4adde79f759e396af399f32c079f8ce6a89919169bd9'
            'b3cb23ef88fcf4f39ee057289e7d2a92a03b2f33ec05caa4d70cd15a2ca60acd'
            '1edfe3540212ff667e460e212b31178e405139fdff18d643bdd49b05623ac3ac')
sha256sums_i686=('d28b91e8fef0277673acca0c19b034b4bcfdbd730760714fe673b535282b5a01')
sha256sums_x86_64=('395408bc1ac0cbe250b3131c09592f7ac490a77a2625ce2f213480a96fcc8bd4')
sha256sums_armv6h=('13118127bd6a7dfaf76cb35833325627d1df6937064f6ec7d3a05f5829902d2b')
sha256sums_armv7h=('97c42a422ddd966681ffad0b5bae3df1203f52b11c5be3a14bcdd76366c1f369')
sha256sums_aarch64=('a9f7d67e29c2b7f2059636c73945b9946185a235dfb12e346e07eb7b0650f714')

package() {
  install -D -m755 "chisel_${pkgver}_$CARCH" "$pkgdir/usr/bin/chisel"
  install -D -m644 "README_${pkgver}.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -D -m644 "users_${pkgver}.json" "$pkgdir/usr/share/doc/$pkgname/users.json"
  install -D -m644 "LICENSE_${pkgver}" "$pkgdir/usr/share/doc/$pkgname/LICENSE"
}
