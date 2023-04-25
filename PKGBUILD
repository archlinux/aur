# Maintainer: Jiri Pospisil <jiri@jpospisil.com>
pkgname=rustic-bin
pkgver=0.5.2
pkgrel=1
pkgdesc='Rustic is a backup tool that provides fast, encrypted, deduplicated backups.'
url='https://github.com/rustic-rs/rustic'
source_x86_64=("https://github.com/rustic-rs/rustic/releases/download/v$pkgver/rustic-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/rustic-rs/rustic/releases/download/v$pkgver/rustic-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
arch=('x86_64' 'aarch64')
license=('Apache')
changelog=CHANGELOG
b2sums_x86_64=('a06855021f2f9cdc41375f81e059a1e27b2ae77fdfeb7267e882919636facb7d75ca1bc4eb54be409b6c40c96362cecdc448294ca1e8028e8450286b69c61e78')
b2sums_aarch64=('9cc7ae6e1c856b367cc9a8cdfc5b98ef325e5d7bea77a59b051608cb127f2e457e471e33081c144c156a00f3260f35ef8ead1b51abedc1d8f5a89f160ac0614c')

package() {
  cd "$srcdir"

  install -Dm755 rustic "$pkgdir/usr/bin/rustic"

  install -Dm644 <("$srcdir"/rustic completions bash 2>/dev/null) "$pkgdir/usr/share/bash-completion/completions/rustic"
  install -Dm644 <("$srcdir"/rustic completions fish 2>/dev/null) "$pkgdir/usr/share/fish/vendor_completions.d/rustic.fish"
  install -Dm644 <("$srcdir"/rustic completions zsh 2>/dev/null) "$pkgdir/usr/share/zsh/site-functions/_rustic"
}
