# Maintainer: nitsky
arch=('x86_64')
conflicts=(deno)
license=('MIT')
pkgdesc="A secure JavaScript and TypeScript runtime."
pkgname=deno-bin
pkgrel=1
pkgver=1.7.5
provides=('deno')
sha256sums_x86_64=('4e2eece7efb110359205b8a0ce5f7ca672cbba8a6a717510866925c2238d8f49')
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
