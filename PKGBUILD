# Maintainer Alexandru Iercosan-Lucaci <lucaci32u4@gmail.com>

pkgname=tmux-ver-28
pkgver=2.8
pkgrel=1
pkgdesc='Tmux legacy version 2.8, before "-style" option breaking changes were introduced.'
arch=('i686' 'x86_64')
url='http://sourceforge.net/projects/tmux/'
screenshot='http://tmux.sourceforge.net/tmux3.png'
license=('BSD')
depends=('ncurses' 'libevent')
provides=('tmux')
source=("git+https://github.com/tmux/tmux.git")
md5sums=('SKIP')

build() {
  cd "${srcdir}"/tmux
  git checkout 2.8 
  ./autogen.sh
  ./configure --prefix=/usr >/dev/null
  make -j 4 >/dev/null
}

package() {
  cd "${srcdir}"/tmux
  make DESTDIR="${pkgdir}" install 
}
