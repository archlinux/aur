# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=rayfish
pkgver=0.2.0
pkgrel=1
pkgdesc="P2P mesh VPN powered by iroh"
arch=('x86_64' 'aarch64')
url="https://github.com/rayfish/rayfish"
license=('MPL-2.0')
depends=('gcc-libs')
options=(!strip)

source_x86_64=("ray-linux-x86_64-$pkgver::$url/releases/download/v$pkgver/ray-linux-x86_64")
source_aarch64=("ray-linux-aarch64-$pkgver::$url/releases/download/v$pkgver/ray-linux-aarch64")

sha256sums_x86_64=('e806d523cf50bec454ef299be3bb5b8aad123ded93911fa86a66d70341915d05')
sha256sums_aarch64=('4e164fce610ffc15808fa40c3c937d372d6857529924c922499510de933e049e')

package() {
  install -Dm755 "$srcdir/ray-linux-$CARCH-$pkgver" "$pkgdir/usr/bin/ray"
}
