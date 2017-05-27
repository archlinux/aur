# Maintainer: schaap137 <dojo86@gmail.com>
pkgname=vim-sxhkdrc-git
pkgver=20150405
pkgrel=1
pkgdesc="Vim syntax for sxhkd's configuration files"
arch=('i686' 'x86_64')
url="https://github.com/baskerville/vim-sxhkdrc"
license=('custom:vim')
depends=('vim')
makedepends=('git')
source=("$pkgname"::"git+https://github.com/baskerville/vim-sxhkdrc")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"
  vim_share_dir="usr/share/vim/vimfiles"
  install -dm755 "$pkgdir/$vim_share_dir" || return 1
  cp -av "$srcdir/$pkgname/"{ftdetect,syntax} \
    "$pkgdir/$vim_share_dir" || return 1
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname" || return 1
  cp -av "$srcdir/$pkgname/"README.md \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE" || return 1
}
