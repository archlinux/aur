# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=registrator
pkgver=1.0
pkgrel=5
pkgdesc="a tool for noise reduction or resolution quadrupling by adding more photos together"
url="http://ronja.twibright.com/registrator.php"
arch=('i686' 'x86_64')
license=('GPL-2')
makedepends=('libjpeg' 'libpng')
depends=('libpng')
source=("http://ronja.twibright.com/utils/${pkgname}.tgz" "png.patch")
md5sums=('36ea4eb3b69ccc6c18cbb758da95f4f2'
         '90ac328f4d462cfa6d2ef4ec5352b0ea')

build() {
cd $srcdir/${pkgname}
patch -p2 <$srcdir/png.patch
make
}

package() {
cd $srcdir/${pkgname}
install -D -m755 deconvolve ${pkgdir}/usr/bin/deconvolve
install -D -m755 registrator ${pkgdir}/usr/bin/registrator
install -D -m755 registrator-bin ${pkgdir}/usr/bin/registrator-bin
}
