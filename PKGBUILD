# Maintainer: Brian Bidulock <bidulock@openss7.org>
_pkgname=vim-scripts
pkgname=vim-systemd
pkgver=r34.7c4724d
pkgrel=1
pkgdesc="ViM syntax highlighting for systemd unit files"
arch=("any")
#url="http://fedorapeople.org/cgit/wwoods/public_git/${_pkgname}.git/"
url=https://github.com/wgwoods/${_pkgname}
license=('GPL')
depends=('vim')
makedepends=('git')
#source=("git+https://fedorapeople.org/cgit/wwoods/public_git/${_pkgname}.git")
source=("git+https://github.com/wgwoods/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package () {
  cd ${_pkgname}
  install -Dm0644 ftdetect/systemd.vim "$pkgdir"/usr/share/vim/vimfiles/ftdetect/systemd.vim
  install -Dm0644 ftdetect/udev.vim "$pkgdir"/usr/share/vim/vimfiles/ftdetect/udev.vim
  install -Dm0644 syntax/systemd.vim "$pkgdir"/usr/share/vim/vimfiles/syntax/systemd.vim
  install -Dm0644 syntax/udev.vim "$pkgdir"/usr/share/vim/vimfiles/syntax/udev.vim
}
