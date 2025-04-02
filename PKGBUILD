# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=uutils-diffutils-bin
pkgver=0.4.2
pkgrel=2
pkgdesc="Rust implementation of diffutils"
arch=('x86_64')
url="https://github.com/uutils/diffutils"
license=('Apache-2.0' 'MIT')
depends=('gcc-libs')
provides=("uutils-diffutils=$pkgver")
conflicts=('uutils-diffutils')
source_x86_64=("https://github.com/uutils/diffutils/releases/download/v$pkgver/diffutils-x86_64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('d0cc703f72efcd9ef98eede144df73a2234c03092517818ca526a15f7e0f4405')


package() {
  install -Dm755 "$srcdir/diffutils-$CARCH-unknown-linux-gnu/diffutils" -t "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/diffutils-$CARCH-unknown-linux-gnu/LICENSE-MIT" -t "$pkgdir/usr/share/licenses/uutils-diffutils"

  # cannot use custom "uu" prefix
  #for path in "$pkgdir/usr/bin"/*; do
  #  dir=$(dirname $path)
  #  basename=$(basename $path)
  #  mv "$dir/$basename" "$dir/uu-$basename"
  #done
}
