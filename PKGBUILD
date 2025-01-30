# Maintainer: dringsim <dringsim@qq.com>
# Contributor: lmartinez-mirror
# Contributor: Michael Herzberg <{firstname}@{firstinitial}{lastname}.de>
pkgname=vim-asyncrun-git
pkgver=2.13.2.r0.g78dc927
pkgrel=1
pkgdesc='Vim plugin for executing shell commands asynchronously'
arch=('any')
url='https://github.com/skywind3000/asyncrun.vim'
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/-/.r/;s/-/./'
}

package() {
  cd "$pkgname"
  find autoload doc lua plugin \
    -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README*.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
