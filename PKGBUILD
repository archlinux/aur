# Maintainer: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
# Contributor: Mike Redd <mredd -at- 0 tue 0 dot com>
#
# `epoch=1` because `pkgver` formerly used dates. For example: `pkgver=20130203`

pkgname='vim-badwolf-git'
_pkgname='badwolf'
pkgver=e6fdf18 # see pkgver()
pkgrel=1
epoch=1
pkgdesc='A color scheme for Vim, pieced together by Steve Losh.'
arch=('any')
url='http://stevelosh.com/projects/badwolf/'
license=('MIT')
groups=('vim-plugins')
depends=('vim')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/sjl/badwolf.git")

md5sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --always | sed 's/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm 644 \
    "colors/${_pkgname}.vim" \
    "$pkgdir/usr/share/vim/vimfiles/colors/${_pkgname}.vim"
  install -Dm 644 \
    LICENSE.markdown \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.markdown"
  install -Dm 644 \
    "contrib/${_pkgname}.muttrc" \
    "$pkgdir/usr/share/vim/vimfiles/contrib/${_pkgname}.muttrc"
}

# vim:set ts=2 sw=2 et:
