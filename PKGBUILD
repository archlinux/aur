# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

# All my PKGBUILDs are managed at https://github.com/eli-schwartz/pkgbuilds

_gitname=KindleTool
pkgname=kindletool
pkgver=1.6.5
pkgrel=2
pkgdesc="Tool for creating/extracting Kindle updates and more"
arch=('i686' 'x86_64')
url="https://github.com/NiLuJe/${_gitname}"
license=('GPL')
depends=('libarchive' 'nettle')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('949cbbd3390a10cb86ebff870a3e00566dbef33630fddb2cbd5ff81f90fb4030')

build() {
    cd "${srcdir}/${_gitname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/${_gitname}-${pkgver}"
    make DESTDIR="${pkgdir}/" install
}
