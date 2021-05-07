# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=vim-quickui-git
pkgver=1.3.2.r5.g86ecb3b
pkgrel=1
pkgdesc="Vim plugin that displays a user-configurable menu bar"
arch=('any')
url="https://github.com/skywind3000/vim-quickui"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver()  {
  cd "$pkgname"
  git describe --long --tags | sed 's/-/.r/;s/-/./'
}

package() {
  cd "$pkgname"
  find autoload colors plugin \
    -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md MANUAL.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
