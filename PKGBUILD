# Maintainer: Xeonacid <h.dwwwwww@gmail.com>

_name=foundry
pkgname=foundryup-git
pkgver=r3227.551bcb5
pkgrel=1
pkgdesc="Update or revert to a specific Foundry branch with ease"
license=('MIT OR Apache-2.0')
arch=(any)
url=https://github.com/Harry24k/adversarial-attacks-pytorch
depends=(cargo bash)
makedepends=(git)
provides=(foundryup)
conflicts=(foundryup)
source=(git+https://github.com/foundry-rs/foundry.git)
sha256sums=('SKIP')
install='post.install'

pkgver() {
  cd "$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$_name"
  install -Dm755 foundryup/foundryup -t "$pkgdir/usr/bin"
  install -Dm644 foundryup/README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"
}
