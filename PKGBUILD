# Maintainer: Cédric Connes <cedric.connes@gmail.com>

pkgname=chisel-tunnel
pkgver=1.2.4
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
md5sums=('7ee9b8a209ad46b7e82778d63de4b76e'
         '94a1b56e4b075e50eca71637dca2ba27')
md5sums_i686=('8290c774509dfaefdca2076ad450c274')
md5sums_x86_64=('65e0883c5c7b7f4f3a01239df3d4c121')
md5sums_arm=('4a31c009ea9e62d82078fa6ae477502c')
md5sums_armv6h=('4a31c009ea9e62d82078fa6ae477502c')
md5sums_armv7h=('4a31c009ea9e62d82078fa6ae477502c')
md5sums_aarch64=('4a31c009ea9e62d82078fa6ae477502c')

package() {
  install -D -m755 "chisel_$CARCH" "$pkgdir/usr/bin/chisel"
  sed -n '/^#### MIT License$/,$ {s/^#### //; p}' README.md > LICENSE
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 -t "$pkgdir/usr/share/doc/$pkgname" README.md users.json
}
