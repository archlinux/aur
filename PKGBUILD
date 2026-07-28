# Maintainer: Skeome <maintainer@example.com>
pkgname=rcc-sync
pkgver=1.2.0
pkgrel=1
pkgdesc="Explicit, non-destructive local <-> OneDrive sync tool for Rogue Community College"
arch=('any')
url="https://github.com/Skeome/rcc-sync"
license=('MIT')
depends=('bash' 'rsync' 'diffutils' 'tar')
optdepends=('libnewt: for full-screen TUI support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Skeome/rcc-sync/archive/refs/tags/v$pkgver.tar.gz")
# PLACEHOLDER — this release hasn't been tagged on GitHub yet, so there is no
# real tarball to hash. After tagging v1.2.0 and pushing it, regenerate this
# with `updpkgsums` (or `makepkg -g`) from inside this directory before
# publishing to the AUR. Do not upload with the placeholder below in place.
sha256sums=('89bf1d308fe83a2081d89067ab796100a41f19343b359cae9896fa4a8b9debb6')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "rcc-sync" "$pkgdir/usr/bin/rcc-sync"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  install -Dm644 "completions/rcc-sync.bash" "$pkgdir/usr/share/bash-completion/completions/rcc-sync"
  install -Dm644 "completions/_rcc-sync" "$pkgdir/usr/share/zsh/site-functions/_rcc-sync"
  install -Dm644 "completions/rcc-sync.fish" "$pkgdir/usr/share/fish/vendor_completions.d/rcc-sync.fish"
}
