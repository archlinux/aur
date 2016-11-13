# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
_pkgname=ctrlp.vim
pkgname=vim-ctrlp-git
pkgver=1.79.699.88b61e7
pkgrel=2
pkgdesc='Full path fuzzy file, buffer, mru, tag, ... finder'
arch=('any') 
url='https://github.com/ctrlpvim/ctrlp.vim'
license=('custom:vim')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
provides=('vim-ctrlp')
conflicts=('vim-ctrlp')
source=("git+https://github.com/ctrlpvim/ctrlp.vim")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -d \
    "${pkgdir}/usr/share/vim/vimfiles/"{autoload,doc,plugin}
  cp -dr autoload/* "${pkgdir}/usr/share/vim/vimfiles/autoload"
  cp -dr doc/* "${pkgdir}/usr/share/vim/vimfiles/doc/"
  install -m644 plugin/ctrlp.vim "${pkgdir}/usr/share/vim/vimfiles/plugin/"
}

# vim:set et sw=2 ts=2 tw=79:
