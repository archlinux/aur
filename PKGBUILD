# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=vim-caw
pkgver=1.1.1
pkgrel=1
pkgdesc="A vim comment plugin supporting operator/non-operator mappings, 300+ filetypes"
arch=('any')
url="https://github.com/tyru/caw.vim"
license=('unknown')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
optdepends=('vim-repeat')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e47348e9c13f0a8e5113c27db4be6cff4e38b63d405dbfa2e2393c3ff6229fed')

package() {
  cd "caw.vim-$pkgver"
  find after autoload doc macros plugin \
    -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
