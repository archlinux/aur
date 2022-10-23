# Maintainer: Mahor1221 <mahor1221 at pm dot me>

pkgname=nix-zsh-completions
pkgver=0.4.4
pkgrel=1
arch=(any)
license=(BSD)
provides=("$pkgname")
conflicts=("$pkgname")
depends=(zsh nix)
pkgdesc="ZSH Completions for Nix"
url="https://github.com/spwhitt/nix-zsh-completions"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/0.4.4.tar.gz")
sha256sums=('c881011da223df6fb6133b5faa7b804170baa6e7a82937928ac0e04089c64fe4')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/zsh/site-functions" _*
  rm "$pkgdir/usr/share/zsh/site-functions/_nix" # provided by nix package
}
