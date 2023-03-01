# Maintainer: Jiri Pospisil <jiri@jpospisil.com>
pkgname=rustic-bin
pkgver=0.4.4
pkgrel=1
pkgdesc='Rustic is a backup tool that provides fast, encrypted, deduplicated backups.'
url='https://github.com/rustic-rs/rustic'
source_x86_64=("https://github.com/rustic-rs/rustic/releases/download/v$pkgver/rustic-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/rustic-rs/rustic/releases/download/v$pkgver/rustic-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
arch=('x86_64' 'aarch64')
license=('Apache')
changelog=CHANGELOG
b2sums_x86_64=('a52ad77da8e79e0a8e262d7393f0174c98db2e89de2d31b76737c172c1a2073d1e5bb0df61141efba3bb9ebf08eaff51e2a1bc14cca9224e14344ca32f09df17')
b2sums_aarch64=('4c6b11757bc04aa29d48f15f0cd4e43f6ab8eab0d2f548cbf22a270d149ae2f39fdf896896343f800d2c06a588ff1e6aa69291c386d40a343447dd09c46a74f1')

package() {
  cd "$srcdir"

  install -Dm755 rustic "$pkgdir/usr/bin/rustic"

  install -Dm644 <("$srcdir"/rustic completions bash 2>/dev/null) "$pkgdir/usr/share/bash-completion/completions/rustic"
  install -Dm644 <("$srcdir"/rustic completions fish 2>/dev/null) "$pkgdir/usr/share/fish/vendor_completions.d/rustic.fish"
  install -Dm644 <("$srcdir"/rustic completions zsh 2>/dev/null) "$pkgdir/usr/share/zsh/site-functions/_rustic"
}
