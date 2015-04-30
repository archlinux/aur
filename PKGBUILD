# Maintainer: Eli Schwartz <eschwartz93@gmail.com>

_gitname=KindleTool
pkgname=kindletool-git
pkgver=1.6.3.r24.g6a3a3e5
pkgrel=2
pkgdesc="Tool for creating/extracting Kindle updates and more"
arch=('i686' 'x86_64')
url="https://github.com/NiLuJe/${_gitname}"
license=('GPL')
depends=('libarchive' 'nettle')
makedepends=('git')
provides=('kindletool')
conflicts=('kindletool')
source=("git://github.com/NiLuJe/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c2-
}

build() {
    cd "${srcdir}/${_gitname}"
    make
}

package() {
    cd "${srcdir}/${_gitname}"
    make DESTDIR="${pkgdir}/" install
}
