# Maintainer : gborzi <gborzi@ieee.org>

pkgname=topmenu-qt-git
_gitname=topmenu-qt
pkgver=2015.02.14
pkgrel=2
pkgdesc="Qt4 module for Topmenu."
url="https://git.javispedro.com/cgit/topmenu-gtk.git/about/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('qt4' 'topmenu-gtk-git')
makedepends=('qt4-private-headers-dev')
groups=('mate-extra')
options=(!libtool)
source=("git+http://git.javispedro.com/cgit/$_gitname.git")
sha1sums=('SKIP')

pkgver() {
   cd "$_gitname"
   git log -1 --format="%cd" --date=short | sed 's|-|.|g'
}

build() {
    cd "${srcdir}/${_gitname}"
    qmake-qt4
    make
}

package() {
    cd "${srcdir}/${_gitname}"
    make INSTALL_ROOT="${pkgdir}" install
}
