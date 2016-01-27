# Maintainer: Daniel Milde <daniel@milde.cz>

pkgname=yourik-qt5
_gitname=yourik-qt5
pkgver=5.392792f
pkgrel=1
pkgdesc="Yourik The Intergalactic Rabbit is the animal rights-themed arcade game."
arch=('any')
url="https://github.com/psemiletov/yourik-qt5"
license=('Public domain')
depends=('qt5-base' 'sdl2_mixer')
source=('git://github.com/psemiletov/yourik-qt5.git')
sha1sums=('SKIP')

build() {
    cd "$srcdir/$_gitname"
    qmake
    make
}

package() {
    cd "$srcdir/$_gitname"
    make INSTALL_ROOT=${pkgdir} install
}

pkgver() {
    cd $_gitname
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}
