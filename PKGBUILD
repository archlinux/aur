# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=registrator
pkgver=1.0
pkgrel=4
pkgdesc="a tool for noise reduction or resolution quadrupling by adding more photos together"
url="http://ronja.twibright.com/registrator.php"
arch=('i686')
license=('GPL-2')
makedepends=('libjpeg' 'libpng')
depends=('libpng')
source=("http://ronja.twibright.com/utils/${pkgname}.tgz")
md5sums=('d192412cbde2c59953a785259667cd3b')

build() {
cd $srcdir/${pkgname}
make
}

package() {
cd $srcdir/${pkgname}
install -D -m755 deconvolve ${pkgdir}/usr/bin/deconvolve
install -D -m755 registrator ${pkgdir}/usr/bin/registrator
install -D -m755 registrator-bin ${pkgdir}/usr/bin/registrator-bin
}
