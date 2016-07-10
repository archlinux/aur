# Maintainer: Abdó Roig-Maranges <abdo.roig@gmail.com>

pkgname=vim-conflict-marker-git
pkgver=20151228
pkgrel=1
pkgdesc="Weapon to fight against conflicts in Vim"
arch=('any')
url="https://github.com/rhysd/conflict-marker.vim"
license=('MIT')
depends=("vim")
makedepends=("git")
provides=("vim-conflict-marker")
conflicts=("vim-conflict-marker")
groups=('vim-plugins')
source=('git+https://github.com/rhysd/conflict-marker.vim.git')
install=vimdoc.install
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/conflict-marker.vim"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/conflict-marker.vim"
  install -d ${pkgdir}/usr/share/vim/vimfiles/{doc,plugin,autoload/conflict_marker}
  install -Dm644 "doc/conflict-marker.txt" "${pkgdir}/usr/share/vim/vimfiles/doc/conflict-marker.txt"
  install -Dm644 "plugin/conflict_marker.vim" "${pkgdir}/usr/share/vim/vimfiles/plugin/conflict_marker.vim"
  install -Dm644 "autoload/conflict_marker.vim" "${pkgdir}/usr/share/vim/vimfiles/autoload/conflict_marker.vim"
  install -Dm644 "autoload/conflict_marker/detect.vim" "${pkgdir}/usr/share/vim/vimfiles/autoload/conflict_marker/detect.vim"
}
