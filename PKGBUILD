# Maintainer: Choi Madeleine <gankiann.niu@gmail.com>

pkgname=mprisence-bin
_pkgname=${pkgname%-bin}
pkgver=v1.8.4
pkgrel=1
pkgdesc="Discord Rich Presence for MPRIS media players"
arch=("x86_64")
url="https://github.com/lazykern/mprisence"
license=("MIT")
depends=("dbus" "gcc-libs" "openssl")
provides=("mprisence")
install=mprisence-bin.install
_filename="$_pkgname-$pkgver-$CARCH-unknown-linux-gnu.tar.gz"
source=("$url/releases/download/$pkgver/$_filename"
  "mprisence-bin.install"
  "mprisence.service"
  "LICENSE")
sha256sums=('465c6a064b957f490f7404882d2183f9e00fe69c47396305e186e7e5a56c009d'
            '651fcb388d7c8cd410ecf3298b015f3b0ed858bbeac86938121ac222df8ad814'
            '636da738dc9ee5769fdf24a7ded3e196338ca7819d1e2c69571b79151b5446ee'
            'd7fa7468ebf10e9bf9938159b17e603a264cc948c339995cfcb47dd34cad5162')

package() {
  cd "$srcdir"
  install -Dm755 "mprisence" "$pkgdir/usr/bin/mprisence"
  install -Dm644 "mprisence.service" "$pkgdir/usr/lib/systemd/user/mprisence.service"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
