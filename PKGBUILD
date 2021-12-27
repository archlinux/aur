# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-wheel
pkgver=2.1
pkgrel=1
pkgdesc="Quick navigation framework for Vim and Neovim"
arch=('any')
url="https://github.com/chimay/wheel"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "LICENSE")
sha256sums=('14b1a1fab702c4221d155af8cb47a95bc9cc551090af31e1bc98313f32c4cdbd'
            'b801c8d677ef9701149e05cf98f28b82a56832dd67c94d96d36d25d063b1b353')

package() {
  cd "wheel-$pkgver"
  find after autoload doc plugin \
    -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
