# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=vim-jsx-pretty-git
_pkgname=vim-jsx-pretty
pkgver=3.0.0.r16.g6989f16
pkgrel=2
pkgdesc="Vim syntax highlighting for React JSX and TSX"
arch=('any')
url="https://github.com/MaxMEllon/vim-jsx-pretty"
license=('MIT')
provides=("${_pkgname}=${pkgver%%.r*}-${pkgrel}")
conflicts=("${_pkgname}")
depends=('vim')
makedepends=('git')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -E 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,-,.,g'
}

package() {
  cd $pkgname
  install -d "$pkgdir/usr/share/vim/vimfiles"
  cp -r after autoload doc "$pkgdir/usr/share/vim/vimfiles/"
  rm -f "$pkgdir/usr/share/vim/vimfiles/doc/tags"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
