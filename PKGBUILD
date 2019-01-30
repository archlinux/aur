# Maintainer: Cédric Connes <cedric.connes@gmail.com>

pkgname=chisel-tunnel
pkgver=1.3.1
pkgrel=1
pkgdesc="A fast TCP tunnel over HTTP"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/jpillora/chisel"
license=('MIT')
source=("README_${pkgver}.md::https://raw.githubusercontent.com/jpillora/chisel/$pkgver/README.md"
        "users_${pkgver}.json::https://raw.githubusercontent.com/jpillora/chisel/$pkgver/example/users.json")
source_i686=("chisel_${pkgver}_i686.gz::https://github.com/jpillora/chisel/releases/download/$pkgver/chisel_linux_386.gz")
source_x86_64=("chisel_${pkgver}_x86_64.gz::https://github.com/jpillora/chisel/releases/download/$pkgver/chisel_linux_amd64.gz")
source_arm=("chisel_${pkgver}_arm.gz::https://github.com/jpillora/chisel/releases/download/$pkgver/chisel_linux_arm.gz")
source_armv6h=("chisel_${pkgver}_armv6h.gz::https://github.com/jpillora/chisel/releases/download/$pkgver/chisel_linux_arm.gz")
source_armv7h=("chisel_${pkgver}_armv7h.gz::https://github.com/jpillora/chisel/releases/download/$pkgver/chisel_linux_arm.gz")
source_aarch64=("chisel_${pkgver}_aarch64.gz::https://github.com/jpillora/chisel/releases/download/$pkgver/chisel_linux_arm.gz")
md5sums=('a64c1a6c1677c0d915bf2d52f33169e6'
         'b962091a3cf143b8e5b7865c24aa32e6')
md5sums_i686=('78491dc7749ca9519305e399bf9d1e38')
md5sums_x86_64=('5de9b51064800dec1762f617fe1c15c4')
md5sums_arm=('8f5a59b2b3d84ff8ed075695a912e0c7')
md5sums_armv6h=('8f5a59b2b3d84ff8ed075695a912e0c7')
md5sums_armv7h=('8f5a59b2b3d84ff8ed075695a912e0c7')
md5sums_aarch64=('8f5a59b2b3d84ff8ed075695a912e0c7')

package() {
  install -D -m755 "chisel_${pkgver}_$CARCH" "$pkgdir/usr/bin/chisel"
  install -D -m644 "README_${pkgver}.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -D -m644 "users_${pkgver}.json" "$pkgdir/usr/share/doc/$pkgname/users.json"
  sed -n '/^#### MIT License$/,$ {s/^#### //; p}' "README_${pkgver}.md" > LICENSE
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
