# Maintainer: MCOfficer <MCOfficer@gmx.de>

pkgname=container-stats-bin
pkgver=0.5.1
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
  '4a933fc81d7f03e189370ee89aa32cc121bdd3c8fbc978052db69cf141c8902d'
  '6047f2bc57e9a94336c69b3f9369a79cb9a09d158f73d6bd00027dc4765de0d3'
)

package() {
  chmod +x "$_binary"
  mkdir -p "$pkgdir/usr/bin"
  cp "$_binary" "$pkgdir/usr/bin/container-stats"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  cp LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}
