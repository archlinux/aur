# Maintainer: beest <gnubeest at zoho dot com>
# Contributor: c0mmando <c0mmand0_88 at yahoo dot com dot ar>
# Contributor: Farhan Yousasf <farhany at gmail dot com>
# Contributor: Vinzenz Vietzke <vinz at archlinux dot us>

pkgname=atari800
pkgver=3.1.0
pkgrel=3
pkgdesc="An emulator of the Atari 800/800XL/130XE/5200 with various extensions"
arch=('i686' 'x86_64')
url="http://atari800.sourceforge.net/"
license=('GPL2')
depends=('sdl')
optdepends=('libpng: PNG screenshot support')
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('354f8756a7f33cf5b7a56377d1759e41')

build()
{
    cd "${pkgname}-${pkgver}"/src
    ./configure --prefix=/usr
    make
}

package() 
{
    cd "${pkgname}-${pkgver}"/src
    make DESTDIR="${pkgdir}/" install
}
