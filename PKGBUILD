# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=rayfish
pkgver=0.3.0
pkgrel=1
pkgdesc="P2P mesh VPN powered by iroh"
arch=('x86_64' 'aarch64')
url="https://github.com/rayfish/rayfish"
license=('MPL-2.0')
depends=('gcc-libs')
options=(!strip)

source_x86_64=("ray-linux-x86_64-$pkgver::$url/releases/download/v$pkgver/ray-linux-x86_64")
source_aarch64=("ray-linux-aarch64-$pkgver::$url/releases/download/v$pkgver/ray-linux-aarch64")

sha256sums_x86_64=('ca7a9eb8cfec9ac930f443eb25eb3f27dc87b92b6d97f8231c1e9174a96a81a8')
sha256sums_aarch64=('ded5b27a4357f6589b340aed2233950626731e823364380192d70bbf35fce34f')

package() {
  install -Dm755 "$srcdir/ray-linux-$CARCH-$pkgver" "$pkgdir/usr/bin/ray"
}
