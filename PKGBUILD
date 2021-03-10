# Maintainer: nitsky
arch=('x86_64')
conflicts=(deno)
license=('MIT')
pkgdesc="A secure JavaScript and TypeScript runtime."
pkgname=deno-bin
pkgrel=1
pkgver=1.8.1
provides=('deno')
sha256sums_x86_64=('bc6a16edfa2c4c3e972c9a419e82d0126c1cd437a3e97d9ae157aaab0ed0d840')
source_x86_64=("$pkgname-$pkgver.zip::https://github.com/denoland/deno/releases/download/v${pkgver}/deno-x86_64-unknown-linux-gnu.zip")
url='https://deno.land/'

package() {
  install -D -m755 deno "$pkgdir/usr/bin/deno"
  if [ -d "$pkgdir/usr/share/bash-completion/completions/" ]; then
    deno completions bash > "$pkgdir/usr/share/bash-completion/completions/deno"
  fi
  if [ -d "$pkgdir/usr/share/fish/completions/" ]; then
    deno completions fish > "$pkgdir/usr/share/fish/completions/deno.fish"
  fi
  if [ -d "$pkgdir/usr/share/zsh/site-functions/" ]; then
    deno completions zsh > "$pkgdir/usr/share/zsh/site-functions/_deno"
  fi
}
