# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Vlad Petrov ejiek@mail.ru

pkgname=vim-table-mode-git
pkgver=4.7.3.r17.g01a395d
pkgrel=1
pkgdesc='Automatic table creator and formatter'
arch=('any')
url='https://github.com/dhruvasagar/vim-table-mode'
license=('custom:vim')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
  cd "$pkgname"
  find autoload doc ftplugin plugin t \
    -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;

  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

# vim:set et sw=2 ts=2 tw=79:
