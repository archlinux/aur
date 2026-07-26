# Maintainer: Skeome <maintainer@example.com>
pkgname=rcc-sync
pkgver=1.1.0
pkgrel=1
pkgdesc="Explicit, non-destructive local <-> OneDrive sync tool for Rogue Community College"
arch=('any')
url="https://github.com/Skeome/rcc-sync"
license=('MIT')
depends=('bash' 'rsync' 'diffutils')
optdepends=('libnewt: for full-screen TUI support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Skeome/rcc-sync/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f97da7c5843cc183556e8491dd438668712d63690c6db9b2bfd5d8ed3ec1df02')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "rcc-sync" "$pkgdir/usr/bin/rcc-sync"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  install -Dm644 "completions/rcc-sync.bash" "$pkgdir/usr/share/bash-completion/completions/rcc-sync"
  install -Dm644 "completions/_rcc-sync" "$pkgdir/usr/share/zsh/site-functions/_rcc-sync"
  install -Dm644 "completions/rcc-sync.fish" "$pkgdir/usr/share/fish/vendor_completions.d/rcc-sync.fish"
}
