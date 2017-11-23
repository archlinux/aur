# Maintainer: Cédric Connes <cedric.connes@gmail.com>

pkgname=chisel-tunnel
pkgver=1.2.3
pkgrel=1
pkgdesc="A fast TCP tunnel over HTTP"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/jpillora/chisel"
license=('MIT')
source=("https://raw.githubusercontent.com/jpillora/chisel/$pkgver/README.md"
        "https://raw.githubusercontent.com/jpillora/chisel/$pkgver/example/users.json")
source_i686=("chisel_i686.gz::https://github.com/jpillora/chisel/releases/download/$pkgver/chisel_linux_386.gz")
source_x86_64=("chisel_x86_64.gz::https://github.com/jpillora/chisel/releases/download/$pkgver/chisel_linux_amd64.gz")
source_arm=("chisel_arm.gz::https://github.com/jpillora/chisel/releases/download/$pkgver/chisel_linux_arm.gz")
source_armv6h=("chisel_armv6h.gz::https://github.com/jpillora/chisel/releases/download/$pkgver/chisel_linux_arm.gz")
source_armv7h=("chisel_armv7h.gz::https://github.com/jpillora/chisel/releases/download/$pkgver/chisel_linux_arm.gz")
source_aarch64=("chisel_aarch64.gz::https://github.com/jpillora/chisel/releases/download/$pkgver/chisel_linux_arm.gz")
md5sums=('a4b9322a6a38e3cdcd11f091241295d4'
         '94a1b56e4b075e50eca71637dca2ba27')
md5sums_i686=('3f252ada8db3eb0de637c734f9cfea64')
md5sums_x86_64=('2d0fbc8b9856f81cd989f1571f65788d')
md5sums_arm=('f1227f985767ba517f1cd7037b637264')
md5sums_armv6h=('f1227f985767ba517f1cd7037b637264')
md5sums_armv7h=('f1227f985767ba517f1cd7037b637264')
md5sums_aarch64=('f1227f985767ba517f1cd7037b637264')

package() {
  install -D -m755 "chisel_$CARCH" "$pkgdir/usr/bin/chisel"
  sed -n '/^#### MIT License$/,$ {s/^#### //; p}' README.md > LICENSE
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 -t "$pkgdir/usr/share/doc/$pkgname" README.md users.json
}
