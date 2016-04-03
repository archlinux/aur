# Maintainer: David PS <dps.helio at gmail dot com>
pkgname=jhelioviewer-swhv
pkgver=2.10.0.6818
pkgrel=1
pkgdesc="Visualization software for solar image data in space weather context"
arch=('x86_64')
url="http://www.jhelioviewer.org/"
license=('MPL')
depends=('java-environment' 'sh')
makedepends=()
noextract=()
source=("$pkgname"
  "${pkgname}.desktop"
  'http://swhv.oma.be/download/jhv-2.10.0.6818.bin.tar.gz'
  'https://raw.githubusercontent.com/Helioviewer-Project/JHelioviewer/master/resources/images/hvImage_160x160.png'
)
md5sums=('945eeacfcf2465f8800c62930ad33524'
         'da3e2a96ce96c4a25d2759c7442b91d5'
         'e1c1e63453733a9c37438ffd8ca32c39'
         'f59e81237e7069b0793316d30c7bba8c'
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

# vim:set ts=2 sw=2 et:
