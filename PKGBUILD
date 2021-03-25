# vim:ts=4:sw=4:expandtab
# Maintainer: milaq <micha.laqua@gmail.com>
pkgname=xmousepasteblock-git
pkgver=1.0.r3.gac8a28c
pkgrel=1
pkgdesc='Middle mouse button primary X selection/clipboard paste disabler.'
arch=('i686' 'x86_64')
url='https://github.com/milaq/XMousePasteBlock'
license=('GPL')
provides=('xmousepasteblock')
depends=('libxi' 'libx11' 'libev' 'libxfixes')
makedepends=('git')
source=('git://github.com/milaq/XMousePasteBlock#branch=master')
sha1sums=('SKIP')

_gitname='XMousePasteBlock'

pkgver() {
    cd "$srcdir/$_gitname"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$_gitname"
    make all
}

package() {
    cd "$_gitname"
    make DESTDIR="$pkgdir/" install
}
