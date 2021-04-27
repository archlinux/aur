# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=vim-workspace
pkgver=1.8.3
pkgrel=1
pkgdesc="Vim workspace manager plugin for managing groups of files"
arch=('any')
url="https://github.com/thaerkh/vim-workspace"
license=('Apache')
depends=('vim-plugin-runtime')
groups=('vim-plugins')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('fa08cc225ec31973aaf5751bf51eefdfb5edcc379f1d698006af1e68974d4a31')

package() {
  cd "$pkgname-$pkgver"
  find doc plugin \
    -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
