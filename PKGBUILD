# Maintainer: Cédric Connes <cedric.connes@gmail.com>

pkgname=chisel-tunnel
pkgver=1.5.2
pkgrel=1
pkgdesc="A fast TCP tunnel over HTTP"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/jpillora/chisel"
license=('MIT')
source=("README_${pkgver}.md::https://raw.githubusercontent.com/jpillora/chisel/v$pkgver/README.md"
        "users_${pkgver}.json::https://raw.githubusercontent.com/jpillora/chisel/v$pkgver/example/users.json"
	"LICENSE_${pkgver}::https://raw.githubusercontent.com/jpillora/chisel/v$pkgver/LICENSE")
source_i686=("chisel_${pkgver}_i686.gz::https://github.com/jpillora/chisel/releases/download/v$pkgver/chisel_${pkgver}_linux_386.gz")
source_x86_64=("chisel_${pkgver}_x86_64.gz::https://github.com/jpillora/chisel/releases/download/v$pkgver/chisel_${pkgver}_linux_amd64.gz")
source_armv6h=("chisel_${pkgver}_armv6h.gz::https://github.com/jpillora/chisel/releases/download/v$pkgver/chisel_${pkgver}_linux_armv6.gz")
source_armv7h=("chisel_${pkgver}_armv7h.gz::https://github.com/jpillora/chisel/releases/download/v$pkgver/chisel_${pkgver}_linux_armv7.gz")
source_aarch64=("chisel_${pkgver}_aarch64.gz::https://github.com/jpillora/chisel/releases/download/v$pkgver/chisel_${pkgver}_linux_arm64.gz")
sha256sums=('3218e28a28e2c5ffca17ee413a80ef1a8e9be7743ea7cf104c4ec5ffbe3c1cdb'
            'b3cb23ef88fcf4f39ee057289e7d2a92a03b2f33ec05caa4d70cd15a2ca60acd'
            '1edfe3540212ff667e460e212b31178e405139fdff18d643bdd49b05623ac3ac')
sha256sums_i686=('90e2d1bb612d9658067799266605dff148b292dafd4f6ddff3e184a9b7998376')
sha256sums_x86_64=('020e1dde294fabdc174cfec3d2405f70d462a897241582d16aff6670230acc45')
sha256sums_armv6h=('90fcf63af14fcaee770bbf4f777845b46fc81a6c38ed966bb80c7b5078d46f17')
sha256sums_armv7h=('c336fabf158958c6946e05e28320ce520adab0ee3ccc7e1bc616179d1ece1908')
sha256sums_aarch64=('78b372bf29a88ec2683f975ab11a728a53a19dba021023d9b2ee46fb94cf3a66')

prepare() {
  # Temporary, until this bug gets fixed: https://bugs.astron.com/view.php?id=112
  zcat "chisel_${pkgver}_$CARCH.gz" > "chisel_${pkgver}_$CARCH"
}

package() {
  install -D -m755 "chisel_${pkgver}_$CARCH" "$pkgdir/usr/bin/chisel"
  install -D -m644 "README_${pkgver}.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -D -m644 "users_${pkgver}.json" "$pkgdir/usr/share/doc/$pkgname/users.json"
  install -D -m644 "LICENSE_${pkgver}" "$pkgdir/usr/share/doc/$pkgname/LICENSE"
}
