# Maintainer: lmartinez-mirror
# Contributor: Jeremy Ruten <jeremy.ruten@gmail.com>
pkgname=vim-cpp-enhanced-highlight-git
pkgver=0.1.r93.g27e0ffc
pkgrel=1
pkgdesc="Additional Vim syntax highlighting for C++"
arch=('any')
url="https://github.com/octol/vim-cpp-enhanced-highlight"
license=('unknown')
depends=('vim-plugin-runtime')
makedepends=('git')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/-/.r/;s/-/./'
}

package() {
  cd "$pkgname"
  find after \
    -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

