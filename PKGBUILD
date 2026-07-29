# Maintainer: Skeome <FraterAstrust@proton.me>
pkgname=rcc-sync
pkgver=1.2.1
pkgrel=1
pkgdesc="Explicit, non-destructive local <-> OneDrive sync tool for Rogue Community College"
arch=('any')
url="https://github.com/Skeome/rcc-sync"
license=('MIT')
depends=('bash' 'rsync' 'diffutils' 'tar')
optdepends=('libnewt: for full-screen TUI support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Skeome/rcc-sync/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c914b1c057d028f895947efd8b162df9f9b2d2c426d47c41083d9f3f6cd8bf41')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "rcc-sync" "$pkgdir/usr/bin/rcc-sync"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  install -Dm644 "completions/rcc-sync.bash" "$pkgdir/usr/share/bash-completion/completions/rcc-sync"
  install -Dm644 "completions/_rcc-sync" "$pkgdir/usr/share/zsh/site-functions/_rcc-sync"
  install -Dm644 "completions/rcc-sync.fish" "$pkgdir/usr/share/fish/vendor_completions.d/rcc-sync.fish"
}
