# Maintainer: Rodrigo Gryzinski <rogryza@gmail.com>

pkgname=vim-jsonnet-git
_pkgname=vim-jsonnet
pkgver=0.23.b7459b3
pkgrel=1
pkgdesc='Jsonnet filetype plugin for Vim.'
arch=('any')
url="https://github.com/google/vim-jsonnet"
license=('APACHE')
makedepends=('git')
depends=('vim')
groups=('vim-plugins')
source=("${pkgname}-${pkgver}::git+https://github.com/google/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd ${srcdir}/${_pkgname}
    echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

package() {
  VIMFILES=$pkgdir/usr/share/vim/vimfiles
  install -d "$VIMFILES"

  cd ${srcdir}/${pkgname}-${pkgver}
  cp -drr --no-preserve=ownership autoload $VIMFILES
  cp -drr --no-preserve=ownership doc $VIMFILES
  cp -drr --no-preserve=ownership ftdetect $VIMFILES
  cp -drr --no-preserve=ownership ftplugin $VIMFILES
  cp -drr --no-preserve=ownership plugin $VIMFILES
  cp -drr --no-preserve=ownership syntax $VIMFILES
  cp -drr --no-preserve=ownership syntax_checkers $VIMFILES
}
