# Maintainer: Jiri Pospisil <jiri@jpospisil.com>
pkgname=rustic-bin
pkgver=0.4.3
pkgrel=1
pkgdesc='Rustic is a backup tool that provides fast, encrypted, deduplicated backups.'
url='https://github.com/rustic-rs/rustic'
source_x86_64=("https://github.com/rustic-rs/rustic/releases/download/v$pkgver/rustic-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/rustic-rs/rustic/releases/download/v$pkgver/rustic-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
arch=('x86_64' 'aarch64')
license=('Apache')
b2sums_x86_64=('7b996f4b6d148dcfe95caf690cb3fee9ebf1450d0b36ad251b085724ccb0c8fb6840a18089a5313fef69679f49473f09349a3da16b69a6847a9cd13bfa3a9d25')
b2sums_aarch64=('8648d6c442c4b772535ebfd4e9b6826d6797c6176784fbc5f853841b83d1e825021a0e5d8780119a679a0ad6006a1dbcbcd7cf8445d53e6be7aa9e75bb447ac3')

package() {
  cd "$srcdir"

  install -Dm755 rustic "$pkgdir/usr/bin/rustic"

  install -Dm644 <("$srcdir"/rustic completions bash 2>/dev/null) "$pkgdir/usr/share/bash-completion/completions/rustic"
  install -Dm644 <("$srcdir"/rustic completions fish 2>/dev/null) "$pkgdir/usr/share/fish/vendor_completions.d/rustic.fish"
  install -Dm644 <("$srcdir"/rustic completions zsh 2>/dev/null) "$pkgdir/usr/share/zsh/site-functions/_rustic"
}
