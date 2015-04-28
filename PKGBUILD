# Maintainer: Eli Schwartz <eschwartz93@gmail.com>
_gitname=KindleTool
pkgname=kindletool
pkgver=1.6.3
pkgrel=2
pkgdesc="Tool for creating/extracting Kindle updates and more"
arch=('i686' 'x86_64')
url="https://github.com/NiLuJe/${_gitname}"
license=('GPL')
depends=('libarchive' 'nettle')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('884bc2586d0c3901c58f5fdfab602c8d7d888feb9bbbbba2a5d3b3dd1c58510e')

build() {
    cd "${srcdir}/${_gitname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/${_gitname}-${pkgver}"
    make DESTDIR="${pkgdir}/" install
}
