# Maintainer: beest <gnubeest@zoho.com>
# Contributor: c0mmando <c0mmand0_88 at yahoo dot com dot ar>
# Contributor: Farhan Yousasf <farhany at gmail dot com>
# Contributor: Vinzenz Vietzke <vinz at archlinux dot us>

pkgname=atari800
pkgver=4.0.0
_pkgver=${pkgver//./_}
pkgrel=1
pkgdesc="An emulator of the Atari 800/800XL/130XE/5200 with various extensions"
arch=('i686' 'x86_64')
url="https://atari800.github.io"
license=('GPL2')
depends=('sdl')
optdepends=('libpng: PNG screenshot support')
source=("https://github.com/atari800/${pkgname}/archive/ATARI800_${_pkgver}.tar.gz")
md5sums=('5657fb4ad09258a692387e565aa1429b')

build()
{
    cd "${pkgname}-ATARI800_${_pkgver}"/src
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() 
{
    cd "${pkgname}-ATARI800_${_pkgver}"/src
    make DESTDIR="${pkgdir}/" install
}
