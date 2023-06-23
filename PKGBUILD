# Maintainer: David PS <dps.helio at gmail dot com>
pkgname=jhelioviewer-swhv
pkgver=4.5.1.10854
pkgrel=1
pkgdesc="Visualization software for solar image data in space weather context"
arch=('x86_64')
url="https://www.jhelioviewer.org/"
license=('MPL')
depends=('java-environment')
source=("$pkgname"
        "${pkgname}.desktop"
        'https://raw.githubusercontent.com/Helioviewer-Project/JHelioviewer/master/resources/images/hvImage_160x160.png'
        "http://swhv.oma.be/download/jhv-${pkgver}.bin.tar.gz"
)
sha256sums=('374d02e91c6e30c32740cd2492b980f24c41ccbdd89c3c1ca30f00cf0b50e287'
            '940d5fb182f76894094754dbe715e13d2a8baa8cb6f944bf82f20e7687a2cac6'
            '8e4b5a7c847469aef79853b58b4fdc5201e3c238c8d921ae5569cdd6ea3879d5'
            '83c0b2dd98d8be8f6c12384b7f63426d402b8b8923a16c4de57e50a1c0a93dab'
         )

package() {
  prefix=${pkgdir}/opt/${pkgname}
  # install files
  mkdir -p ${prefix}
  cp -r $srcdir/jhv-${pkgver}/* $prefix

  # install icon
  install -D -m644 $srcdir/hvImage_160x160.png $pkgdir/usr/share/pixmaps/${pkgname}.png

  # install /usr/bin binary
  install -D -m755 $srcdir/$pkgname $pkgdir/usr/bin/$pkgname

  # install desktop entry
  install -D -m644 $srcdir/${pkgname}.desktop $pkgdir/usr/share/applications/${pkgname}.desktop
}
