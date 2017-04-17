# Maintainer: Cédric Connes <cedric.connes@gmail.com>

pkgname=chisel-tunnel
pkgver=1.2.2
pkgrel=1
pkgdesc="A fast TCP tunnel over HTTP"
arch=('i686' 'x86_64')
url="https://github.com/jpillora/chisel"
license=('MIT')
source=("https://raw.githubusercontent.com/jpillora/chisel/$pkgver/README.md"
        "https://raw.githubusercontent.com/jpillora/chisel/$pkgver/example/users.json")
source_i686=("chisel_i686.gz::https://github.com/jpillora/chisel/releases/download/$pkgver/chisel_linux_386.gz")
source_x86_64=("chisel_x86_64.gz::https://github.com/jpillora/chisel/releases/download/$pkgver/chisel_linux_amd64.gz")
md5sums=('a4b9322a6a38e3cdcd11f091241295d4'
         '94a1b56e4b075e50eca71637dca2ba27')
md5sums_i686=('588094f95dd8a4022280bbb38c6a5d1a')
md5sums_x86_64=('69e4a6c7322038beea821749568cc2f3')

package() {
  install -D -m755 "chisel_$CARCH" "$pkgdir/usr/bin/chisel"
  sed -n '/^#### MIT License$/,$ {s/^#### //; p}' README.md > LICENSE
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 -t "$pkgdir/usr/share/doc/$pkgname" README.md users.json
}
