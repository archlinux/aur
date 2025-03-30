# Maintainer: hackia <hackia at eytukan dot com>

pkgname=woman
pkgver=0.0.1
pkgrel=1
pkgdesc="Rust Live Dev Environment with screen|tmux and web monitoring via ttyd"
arch=('any')
url="https://github.com/hackia/woman"
license=('GPL')
depends=('ttyd' 'rustup' 'cargo' 'cargo-watch' 'cargo-audit' 'cargo-deny' 'cargo-hack' 'cargo-udeps' 'screen' 'tmux')
optdepends=('code' 'fish' 'zsh' 'lazygit')
provides=('woman')
source=("https://github.com/hackia/woman/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('f3781cbb4e9e190df38c3fe7fa80ba69bf6f9dbafb158e0426dd4604f2f1ba794450679005a38d0f9f1dad0696e2f22b8b086b2d7d08a0f99bb4fd3b0f7ed5d8')

check() {
  cd "$pkgname-$pkgver"
  make check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

