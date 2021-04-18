# Maintainer: nitsky
arch=('x86_64')
conflicts=(deno)
license=('MIT')
pkgdesc="A secure JavaScript and TypeScript runtime."
pkgname=deno-bin
pkgrel=1
pkgver=1.9.0
provides=('deno')
sha256sums_x86_64=('94341d2eb5a319986bb35e7959d35dbe47c55904fb56f4245e528e9b9e2a7a44')
source_x86_64=("$pkgname-$pkgver.zip::https://github.com/denoland/deno/releases/download/v${pkgver}/deno-x86_64-unknown-linux-gnu.zip")
url='https://deno.land/'

package() {
  install -D -m 755 deno "$pkgdir/usr/bin/deno"
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
