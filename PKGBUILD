# Maintainer: David PS <dps.helio at gmail dot com>
pkgname=jhelioviewer-swhv
pkgver=4.5.0.10800
pkgrel=1
pkgdesc="Visualization software for solar image data in space weather context"
arch=('x86_64')
url="https://www.jhelioviewer.org/"
license=('MPL')
depends=('java-environment' 'sh' 'cspice')
source=("$pkgname"
  "${pkgname}.desktop"
  "http://swhv.oma.be/download/jhv-${pkgver}.bin.tar.gz"
  'https://raw.githubusercontent.com/Helioviewer-Project/JHelioviewer/master/resources/images/hvImage_160x160.png'
)
sha256sums=('676fc852055d8330cbaf7f523c7353c4f8c616c7c068bfbd156590b81c6d3e9e'
         '940d5fb182f76894094754dbe715e13d2a8baa8cb6f944bf82f20e7687a2cac6'
         '033defb0614a0200101d8511816753c3e9c21b98fbecbc9a909d778afce8d17d'
         '8e4b5a7c847469aef79853b58b4fdc5201e3c238c8d921ae5569cdd6ea3879d5'
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
