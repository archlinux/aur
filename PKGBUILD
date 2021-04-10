# Maintainer: lmartinez-mirror
pkgname=vim-suda
pkgver=0.3.0
pkgrel=1
pkgdesc="Vim plugin for writing out files with sudo"
arch=('any')
url="https://github.com/lambdalisue/suda.vim"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime' 'sudo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5954be80cb6d8240341a8a9303fc2f761d7b31c36ed63517d5abae4b1c703b4d')

package() {
  cd "suda.vim-$pkgver"
  find autoload doc plugin \
    -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
