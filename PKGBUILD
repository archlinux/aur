# Maintainer: MCOfficer <MCOfficer@gmx.de>

pkgname=container-stats-bin
pkgver=0.5.2
pkgrel=1
arch=(x86_64)
pkgdesc="A small tool to analyze RAM usage of large amounts of docker containers"
url="https://github.com/brandad-systems/container-stats"
license=('MIT')
depends=()
_binary="container-stats-$arch-unknown-linux-musl"
source=(
  "https://github.com/brandad-systems/container-stats/releases/download/v${pkgver}/${_binary}"
  "https://raw.githubusercontent.com/brandad-systems/container-stats/v${pkgver}/LICENSE"
)
sha256sums=(
  '9d08b117ae816241bb6623411b3710e0bf8463e920062bdb54df70df180cbe48'
  '6047f2bc57e9a94336c69b3f9369a79cb9a09d158f73d6bd00027dc4765de0d3'
)

package() {
  chmod +x "$_binary"
  mkdir -p "$pkgdir/usr/bin"
  cp "$_binary" "$pkgdir/usr/bin/container-stats"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  cp LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}
