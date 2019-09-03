# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=gruvbox-material-git
pkgdesc="Gruvbox with Material Palette"
pkgrel=1
pkgver=v0.3.r75.ge0ab276
arch=('any')
url="https://github.com/sainnhe/gruvbox-material"
license=('MIT' 'Anti-996')
md5sums=('SKIP')
makedepends=('git')
depends=('vim')
optdepends=('vim-airline-git' 'vim-lightline-git')
_pkgname=gruvbox-material
source=("git+https://github.com/sainnhe/gruvbox-material.git")

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags| sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm644 colors/gruvbox-material.vim "$pkgdir/usr/share/vim/vimfiles/colors/gruvbox-material.vim"
  install -Dm755 ${srcdir}/${_pkgname}/autoload/airline/themes/gruvbox_material.vim ${pkgdir}/usr/share/vim/vimfiles/autoload/airline/themes/gruvbox_material.vim
  install -Dm755 ${srcdir}/${_pkgname}/autoload/lightline/colorscheme/gruvbox_material.vim ${pkgdir}/usr/share/vim/vimfiles/autoload/lightline/colorscheme/gruvbox_material.vim
  install -Dm755 ${srcdir}/${_pkgname}/autoload/leaderf/colorscheme/gruvbox_material.vim ${pkgdir}/usr/share/vim/vimfiles/autoload/leaderf/colorscheme/gruvbox_material.vim
}

# vim:set ts=2 sw=2 et:
