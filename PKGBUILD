_pkgname=vim-pandoc
pkgname=vim-pandoc-git
pkgver=2.0.r432.gd4fc6f8
pkgrel=1
pkgdesc="plugin for writing and editing documents in Pandoc's extended markdown"
arch=('any')
url='https://github.com/vim-pandoc/vim-pandoc'
license=('MIT')
depends=('vim')
makedepends=('git')
source=('git+https://github.com/vim-pandoc/vim-pandoc.git')
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$_pkgname"
  install -dm755 "$pkgdir/usr/share/vim/vimfiles"
  find * -maxdepth 0 -type d -exec cp -R -t "$pkgdir/usr/share/vim/vimfiles" '{}' \+
}

