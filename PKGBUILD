# Maintainer: lmartinez-mirror
pkgname=vim-asyncrun
pkgver=2.8.6
pkgrel=1
pkgdesc="Vim plugin for executing shell commands asynchronously"
arch=('any')
url="https://github.com/skywind3000/asyncrun.vim"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c117705843c04b2b416811f3ee5f358d34ff9adb60ede78f1f5427fa4a3616c8')

package() {
  cd "asyncrun.vim-$pkgver"
  find doc plugin \
    -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README*.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
