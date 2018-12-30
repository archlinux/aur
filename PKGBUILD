# Maintainer: Cédric Connes <cedric.connes@gmail.com>

pkgname=chisel-tunnel
pkgver=1.3.0
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
md5sums=('2c4d0434351745668a7ac869d224f445'
         'b962091a3cf143b8e5b7865c24aa32e6')
md5sums_i686=('07953b0c7cb7a497eecf947fbcdeed2d')
md5sums_x86_64=('5339a456f759aae0f5fbbe013d73a055')
md5sums_arm=('2a7a8aa65395f00116791dd0ee7b8af1')
md5sums_armv6h=('2a7a8aa65395f00116791dd0ee7b8af1')
md5sums_armv7h=('2a7a8aa65395f00116791dd0ee7b8af1')
md5sums_aarch64=('2a7a8aa65395f00116791dd0ee7b8af1')

package() {
  install -D -m755 "chisel_${pkgver}_$CARCH" "$pkgdir/usr/bin/chisel"
  install -D -m644 "README_${pkgver}.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -D -m644 "users_${pkgver}.json" "$pkgdir/usr/share/doc/$pkgname/users.json"
  sed -n '/^#### MIT License$/,$ {s/^#### //; p}' "README_${pkgver}.md" > LICENSE
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
