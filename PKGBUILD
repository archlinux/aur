# Maintainer: Jeff Dickey <releases at usage dot jdx dot dev>

pkgname=usage-bin
pkgver=0.8.3
pkgrel=1
pkgdesc='A specification for CLIs'
arch=('x86_64')
url='https://github.com/jdx/usage'
license=('MIT')
provides=('usage')
options=('!lto')
source=("usage-$pkgver.tar.gz::https://github.com/jdx/usage/releases/download/v$pkgver/usage-x86_64-unknown-linux-gnu.tar.gz")
sha512sums=('3a95c6f1ec9eb663974f5451cc90b35562aadd1e95d76b82640127ae892a2bdadac3b62bd054ce08b08d36b748af107c81e836284c58bc7d375cfc85ee9f5bfc')

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
