# Maintainer: Thomas Lübking <thomas.luebking at gmail>

pkgname=sqriptor-git
_gitname=sqriptor
pkgver=1
pkgrel=1
pkgdesc="Greatest and best TextEditor in the World. Tribute."
arch=('i686' 'x86_64')
url="https://github.com/luebking/sqriptor"
license=('GPL')
depends=('qt5-base')
makedepends=('git')
provides=('sqriptor')
conflicts=('sqriptor')
source=("git+https://github.com/luebking/sqriptor")
md5sums=("SKIP")

pkgver() {
    cd ${_gitname}
    git rev-list --count HEAD
}

build()
{
    cd ${_gitname}
    qmake-qt5 && make || return 1
}

package() {
    cd $srcdir/$_gitname
    strip sqriptor
    mkdir -p $pkgdir/usr/bin
    install sqriptor $pkgdir/usr/bin
}
