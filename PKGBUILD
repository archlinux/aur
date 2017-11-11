 
# Maintainer: Jan Neumann <neum dot ja at gmail dot com>


pkgname=liquidshell-git
_gitname=liquidshell
pkgver=r65.87b14e3
pkgrel=1
pkgdesc='liquidshell is an alternative to plasmashell'
arch=('x86_64')
url='https://cgit.kde.org/liquidshell.git/'
license=('GPL3')
depends=('networkmanager-qt' 'bluez-qt' 'kcmutils' 'knewstuff')
makedepends=('cmake' 'extra-cmake-modules' 'git')
source=("git+git://anongit.kde.org/liquidshell.git")
sha256sums=('SKIP')

pkgver() {
  
  cd ${srcdir}/${_gitname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {
  
  cd ${srcdir}/${_gitname}
  mkdir build && cd build
  cmake  ..
    
  make

}

package() {
  
  install -Dm755 ${srcdir}/${_gitname}/build/liquidshell ${pkgdir}/usr/bin/liquidshell

}
