# Maintainer: Cédric Connes <cedric.connes@gmail.com>

pkgname=chisel-tunnel
pkgver=1.2.5
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
md5sums=('7ee9b8a209ad46b7e82778d63de4b76e'
         '94a1b56e4b075e50eca71637dca2ba27')
md5sums_i686=('8bdad8c25ad14f2efc3e5db8576891c9')
md5sums_x86_64=('56578893ba577047a55bf7c01998ef81')
md5sums_arm=('82745e7ed9b4e18c339ec245f1dfd141')
md5sums_armv6h=('82745e7ed9b4e18c339ec245f1dfd141')
md5sums_armv7h=('82745e7ed9b4e18c339ec245f1dfd141')
md5sums_aarch64=('82745e7ed9b4e18c339ec245f1dfd141')

package() {
  install -D -m755 "chisel_${pkgver}_$CARCH" "$pkgdir/usr/bin/chisel"
  install -D -m644 "README_${pkgver}.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -D -m644 "users_${pkgver}.json" "$pkgdir/usr/share/doc/$pkgname/users.json"
  sed -n '/^#### MIT License$/,$ {s/^#### //; p}' "README_${pkgver}.md" > LICENSE
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
