# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=uutils-diffutils-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Rust implementation of diffutils"
arch=('x86_64')
url="https://github.com/uutils/diffutils"
license=('Apache-2.0' 'MIT')
depends=('gcc-libs' 'glibc')
provides=("uutils-diffutils=$pkgver")
conflicts=('uutils-diffutils')
source_x86_64=("https://github.com/uutils/diffutils/releases/download/v$pkgver/diffutils-x86_64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('322e59ab837ecaf838c4511091615b01bf289030699133e45fa5843e53dfc32b')


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
