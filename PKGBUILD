# Maintainer: lmartinez-mirror
# Contributor: Michael Herzberg <{firstname}@{firstinitial}{lastname}.de>
pkgname=vim-asyncrun-git
pkgver=2.8.6.r0.g168d6b4
pkgrel=1
pkgdesc='Run Async Shell Commands in Vim 8.0 / NeoVim and Output to Quickfix Window'
arch=('any')
license=('MIT')
url='https://github.com/skywind3000/asyncrun.vim'
depends=('vim-plugin-runtime')
makedepends=('git')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/-/.r/;s/-/./'
}

package() {
  cd "$pkgname"
  find doc plugin \
    -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
