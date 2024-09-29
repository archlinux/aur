# Maintainer: Jeff Dickey <releases at usage dot jdx dot dev>

pkgname=usage-bin
pkgver=0.8.4
pkgrel=1
pkgdesc='A specification for CLIs'
arch=('x86_64')
url='https://github.com/jdx/usage'
license=('MIT')
provides=('usage')
options=('!lto')
source=("usage-$pkgver.tar.gz::https://github.com/jdx/usage/releases/download/v$pkgver/usage-x86_64-unknown-linux-gnu.tar.gz")
sha512sums=('e6626800018e9c7f7cba7878c820cd335c4235081c93d107eb9b7f76d2cff95ea20c557bb0b9a52ec7b0c5d1081d76d29399db1585e710e86f6e68a3b9daf37f')

build() {
  cd "$srcdir/"
  # usage/bin/usage completions bash > usage.bash
  # usage/bin/usage completions fish > usage.fish
  # usage/bin/usage completions zsh > _usage
}

package() {
  cd "$srcdir/"
  install -Dm755 usage "$pkgdir/usr/bin/usage"
  # install -Dm644 usage/man/man1/usage.1 "$pkgdir/usr/share/man/man1/usage.1"
  # install -Dm644 usage.bash "$pkgdir/usr/share/bash-completion/completions/usage"
  # install -Dm644 usage.fish "$pkgdir/usr/share/fish/completions/usage.fish"
  # install -Dm644 _usage "$pkgdir/usr/share/zsh/site-functions/_usage"
}

check() {
    "$srcdir/usage" --version
}
