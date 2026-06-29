# Maintainer: Cédric Connes <cedric.connes@gmail.com>

pkgname=chisel-tunnel-bin
pkgver=1.11.7
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
sha256sums=('5a1f193ef28b529eee01cf734ef5701ee174d219f94e41d3d110bf5286a532a8'
            'b3cb23ef88fcf4f39ee057289e7d2a92a03b2f33ec05caa4d70cd15a2ca60acd'
            '445b61eeea1445c155ad63e1c47b1abfa80a922f2f133577f19c12bf9582c0ff')
sha256sums_i686=('b9d242a8c0e7151610abbe2aa9c7f17172fc15564b879f53b76667acb4117be4')
sha256sums_x86_64=('48be5a24ac2571e1aef16e1340c2d1eda2818a9f8d7974ace77e95d19b1b1fe6')
sha256sums_armv6h=('e5a15f0f7f9634da61b64fbf89cf86b51fe3f5afa28ea3ec5ce7e9c73d861087')
sha256sums_armv7h=('1d006727fa11268229d149374a5aa9b43ee587085c93c4b4a3180e09c22ae133')
sha256sums_aarch64=('fea0e120a2d01b8ba5d4c1d4a0a329b240e2b955df80c60110298e2f0b7f237b')

package() {
  install -D -m755 "chisel_${pkgver}_$CARCH" "$pkgdir/usr/bin/chisel"
  install -D -m644 "README_${pkgver}.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -D -m644 "users_${pkgver}.json" "$pkgdir/usr/share/doc/$pkgname/users.json"
  install -D -m644 "LICENSE_${pkgver}" "$pkgdir/usr/share/doc/$pkgname/LICENSE"
}
