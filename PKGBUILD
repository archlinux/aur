# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=clipmenu-git
_gitname=clipmenu
pkgver=6.2.0.r32.gd80842e
pkgrel=1
pkgdesc='Clipboard management using dmenu'
url='http://github.com/cdown/clipmenu'
arch=(any)
license=('MIT')
depends=(dmenu libx11 libxfixes)
provides=(clipmenu)
conflicts=(clipmenu)
makedepends=(git)

source=('git+https://github.com/cdown/clipmenu.git#branch=develop')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir?}/$_gitname"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir?}/$_gitname"
    make install DESTDIR="${pkgdir?}" PREFIX="/usr"
}
