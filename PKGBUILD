# Maintainer: Breno Cunha Queiroz <breno1423@gmail.com>

pkgname=git-kudos
pkgver=1.0.0
pkgrel=1
pkgdesc="Print repo contributions and give authors their well-deserved kudos!"
arch=(x86_64)
url="https://github.com/brenocq/git-kudos"
license=('MIT')
depends=(cmake git)
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    "git-kudos::$url/releases/download/v$pkgver/git-kudos-linux-x86_64"
)
sha256sums=(
    'SKIP'
    'SKIP'
)

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "$srcdir/git-kudos" "$pkgdir/usr/bin/git-kudos"
  install -Dm644 completion/git-kudos.sh "$pkgdir/usr/share/bash-completion/completions/git-kudos"
  install -Dm644 completion/git-kudos.fish "$pkgdir/usr/share/fish/completions/git-kudos.fish"
  install -Dm644 completion/git-kudos.zsh "$pkgdir/usr/share/zsh/site-functions/_git-kudos"
}
