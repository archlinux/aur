 
# Maintainer: Jan Neumann <neum dot ja at gmail dot com>


pkgname=qt-mpris-git
_gitname=qtmpris
pkgver=r27.7251898
pkgrel=1
pkgdesc='Qt and QML MPRIS interface and adaptor'
arch=('x86_64')
url='https://github.com/nemomobile/qtmpris'
license=('LGPL')
depends=('qt5-base' 'qt-dbus-extended-git')
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
