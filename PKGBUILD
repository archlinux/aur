# Maintainer: Cédric Connes <cedric.connes@gmail.com>

pkgname=chisel-tunnel-bin
pkgver=1.10.0
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
sha256sums=('15f1baee3b74b3921ebf056006050a0f26c0311c252ed26e7854260efa236683'
            'b3cb23ef88fcf4f39ee057289e7d2a92a03b2f33ec05caa4d70cd15a2ca60acd'
            '445b61eeea1445c155ad63e1c47b1abfa80a922f2f133577f19c12bf9582c0ff')
sha256sums_i686=('c404ec6548b18ba8e49d29cc609e6375a4e4c65c66b23694a81ba6bd59bfbb81')
sha256sums_x86_64=('09c47937d391442c465dc89389a4568e8ed7d392f1f3b85c02516bb8a8b7d084')
sha256sums_armv6h=('a68994c80c1a451051ec74fd2ba760585065021b0da4f78485e00dc8e6c6ee4c')
sha256sums_armv7h=('3d864e17f4213961a83be2e176373090432298a6e0ba9e4f577b3fd7642321bc')
sha256sums_aarch64=('64306d226c0aa23544afe9b718017415e189af2da058bd2041ce6d1d61b10979')

package() {
  install -D -m755 "chisel_${pkgver}_$CARCH" "$pkgdir/usr/bin/chisel"
  install -D -m644 "README_${pkgver}.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -D -m644 "users_${pkgver}.json" "$pkgdir/usr/share/doc/$pkgname/users.json"
  install -D -m644 "LICENSE_${pkgver}" "$pkgdir/usr/share/doc/$pkgname/LICENSE"
}
