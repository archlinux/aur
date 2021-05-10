# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Jeremy Ruten <jeremy.ruten@gmail.com>

pkgname=vim-cpp-enhanced-highlight-git
pkgver=0.1.r94.g4b7314a
pkgrel=3
pkgdesc="Additional Vim syntax highlighting for C++"
arch=('any')
url="https://github.com/octol/vim-cpp-enhanced-highlight"
license=('MIT')
depends=('vim-plugin-runtime')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/-/.r/;s/-/./'
}

package() {
  cd "$pkgname"
  find after \
    -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

