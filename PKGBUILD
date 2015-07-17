# Maintainer: Lex Black <autumn-wind at web dot de>

_pkgname=canto-curses
pkgname=canto-curses-git
pkgver=0.9.3.r60.g456e3b8
pkgrel=1
pkgdesc="ncurses user interface for canto-daemon/canto-next. Git version"
url="http://codezen.org/canto-ng/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('ncurses' 'readline' 'canto-daemon>=0.9.1')
makedepends=('git')
conflicts=('canto-curses')
provides=('canto-curses=0.9.4')
source=('git://github.com/themoken/canto-curses#branch=master')
md5sums=('SKIP')


pkgver() {
    cd $_pkgname
    git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//'
}

build() {
    cd $srcdir/$_pkgname

    python setup.py build
}

package() {
    cd $srcdir/$_pkgname

    python setup.py install --prefix=/usr --root=${pkgdir} #--optimize=1
}
