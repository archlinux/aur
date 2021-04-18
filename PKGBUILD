# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
pkgname=vim-wheel
pkgver=1.19
pkgrel=1
pkgdesc="Quick navigation framework for Vim and Neovim"
arch=('any')
url="https://github.com/chimay/wheel"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "LICENSE")
sha256sums=('041f016dc317c73563e13364d4b1487e88efddeae5479e35b4b262ea8f30bf33'
            'b801c8d677ef9701149e05cf98f28b82a56832dd67c94d96d36d25d063b1b353')

package() {
  cd "wheel-$pkgver"
  find after autoload doc plugin \
    -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dm 644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
