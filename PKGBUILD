# Maintainer: Cédric Connes <cedric.connes@gmail.com>

pkgname=chisel-tunnel
pkgver=1.2.2
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
md5sums_i686=('588094f95dd8a4022280bbb38c6a5d1a')
md5sums_x86_64=('69e4a6c7322038beea821749568cc2f3')
md5sums_arm=('1e7fb78655febc1c5ddabdd6d4fc4a12')
md5sums_armv6h=('1e7fb78655febc1c5ddabdd6d4fc4a12')
md5sums_armv7h=('1e7fb78655febc1c5ddabdd6d4fc4a12')
md5sums_aarch64=('1e7fb78655febc1c5ddabdd6d4fc4a12')

package() {
  install -D -m755 "chisel_$CARCH" "$pkgdir/usr/bin/chisel"
  sed -n '/^#### MIT License$/,$ {s/^#### //; p}' README.md > LICENSE
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 -t "$pkgdir/usr/share/doc/$pkgname" README.md users.json
}
