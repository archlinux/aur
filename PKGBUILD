# Maintainer: Jiri Pospisil <jiri@jpospisil.com>
pkgname=rustic-bin
pkgver=0.5.4
pkgrel=1
pkgdesc='Rustic is a backup tool that provides fast, encrypted, deduplicated backups.'
url='https://github.com/rustic-rs/rustic'
source_x86_64=("https://github.com/rustic-rs/rustic/releases/download/v$pkgver/rustic-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/rustic-rs/rustic/releases/download/v$pkgver/rustic-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
arch=('x86_64' 'aarch64')
provides=('rustic')
conflicts=('rustic')
license=('Apache')
changelog=CHANGELOG
b2sums_x86_64=('4283268ea7d08c6f7986b83b65210e7066f4436511eb13b3c0d0d8e6bdc0f13bdd62e8466930fe5a4f12964f2cb9ce534005d4af0924bc24763a334f0439681c')
b2sums_aarch64=('8852bfbeed8bf8e326ddc89f8f4f22b38e385bfdfe5e23c634ce79a6aa87469a8f25c05b1dda17119c25c5461c5c303ade8b705086ef99b332cb9ee5e1cd7827')

package() {
  cd "$srcdir"

  install -Dm755 rustic "$pkgdir/usr/bin/rustic"

  install -Dm644 <("$srcdir"/rustic completions bash 2>/dev/null) "$pkgdir/usr/share/bash-completion/completions/rustic"
  install -Dm644 <("$srcdir"/rustic completions fish 2>/dev/null) "$pkgdir/usr/share/fish/vendor_completions.d/rustic.fish"
  install -Dm644 <("$srcdir"/rustic completions zsh 2>/dev/null) "$pkgdir/usr/share/zsh/site-functions/_rustic"
}
