# Maintainer: Eli Schwartz <eschwartz93@gmail.com>
_gitname=KindleTool
pkgname=kindletool
pkgver=1.6.4
pkgrel=1
pkgdesc="Tool for creating/extracting Kindle updates and more"
arch=('i686' 'x86_64')
url="https://github.com/NiLuJe/${_gitname}"
license=('GPL')
depends=('libarchive' 'nettle')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('1876e13f33fe1026c51632ce3602ef8a011738af9ed7ed933fd18767f967da21')

build() {
    cd "${srcdir}/${_gitname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/${_gitname}-${pkgver}"
    make DESTDIR="${pkgdir}/" install
}
