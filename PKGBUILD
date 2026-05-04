pkgname=wfetch
pkgver=0.1.0
pkgrel=1
pkgdesc="system information fetch tool written with zig"
arch=('x86_64')
url="https://codeberg.org/slowy07/wfetch"
license=('MIT')
makedepends=('zig' 'git')
source=("git+https://codeberg.org/slowy07/wfetch.git")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  zig build -Doptimize=ReleaseFast
}

package() {
  cd "$pkgname"
  install -Dm755 "zig-out/bin/wfetch" "$pkgdir/usr/bin/wfetch"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/license/$pkgname/LICENSE"
}
