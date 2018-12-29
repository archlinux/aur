 
# Maintainer: Jan Neumann <neum dot ja at gmail dot com>


pkgname=qt-dbus-extended-git
_gitname=qtdbusextended
pkgver=0.0.3.r0.g3497143
pkgrel=1
pkgdesc='Extended DBus for Qt'
arch=('x86_64')
url='https://github.com/nemomobile/qtdbusextended'
license=('LGPL')
depends=('qt5-base')
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
   cd ${srcdir}/${_gitname}
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
   
}
           
build() {
   cd ${srcdir}/${_gitname}
   qmake && make
   
}

package() {
   make -C ${srcdir}/${_gitname} INSTALL_ROOT="${pkgdir}" install
   
}
