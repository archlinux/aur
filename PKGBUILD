# Maintainer: Choi Madeleine <gankiann.niu@gmail.com>

pkgname=mprisence-bin
_pkgname=${pkgname%-bin}
pkgver=v1.4.3
pkgrel=1
pkgdesc="Discord Rich Presence for MPRIS media players"
arch=("x86_64")
url="https://github.com/lazykern/mprisence"
license=("MIT")
depends=("gcc-libs")
provides=("mprisence")
install=mprisence-bin.install
_filename="$_pkgname-$pkgver-$CARCH-unknown-linux-gnu.tar.gz"
source=("$url/releases/download/$pkgver/$_filename"
  "mprisence-bin.install"
  "mprisence.service"
  "LICENSE")
sha256sums=("94434c41812d9afeab255dfc9003f9a5b5bcf07b780252adcd67198418733640"
  "SKIP"
  "SKIP"
  "SKIP")

package() {
  cd "$srcdir"
  install -Dm755 "mprisence" "$pkgdir/usr/bin/mprisence"
  install -Dm644 "mprisence.service" "$pkgdir/usr/lib/systemd/user/mprisence.service"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
