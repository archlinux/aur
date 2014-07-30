_pkgname=vim-eunuch
pkgname=vim-eunuch-git
pkgver=1403562539
pkgrel=1
pkgdesc="Vim sugar for the UNIX shell commands that need it the most, by tpope"
arch=('any')
url='https://github.com/tpope/vim-eunuch'
license=('custom:vim')
depends=('vim')
makedepends=('git')
provides=('vim-eunuch')
conflicts=('vim-eunuch')

source=('git://github.com/tpope/vim-eunuch.git')
sha512sums=('SKIP')

pkgver() {
  cd -- "$srcdir/$_pkgname"
  git log -n1 --pretty=format:%ct
}

package() {
  cd "$srcdir/$_pkgname"
  install -dm755 "$pkgdir/usr/share/vim/vimfiles"
  find * -maxdepth 0 -type d -exec cp -R -t "$pkgdir/usr/share/vim/vimfiles" '{}' \+
}

