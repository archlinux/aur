_pkgname=vim-sensible
pkgname=vim-sensible-git
pkgver=1404706506
pkgrel=1
pkgdesc="vim defaults everyone can agree on"
arch=('any')
url='https://github.com/tpope/vim-sensible'
license=('custom:vim')
depends=('vim')
makedepends=('git')
provides=('vim-sensible')
conflicts=('vim-sensible')

source=('git://github.com/tpope/vim-sensible.git')
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

