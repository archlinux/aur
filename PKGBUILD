# Maintainer: David PS <dps.helio at gmail dot com>
pkgname=jhelioviewer-swhv
pkgver=2.10.8.8194
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
  "http://swhv.oma.be/download/jhv-${pkgver}.bin.tar.gz"
  'https://raw.githubusercontent.com/Helioviewer-Project/JHelioviewer/master/resources/images/hvImage_160x160.png'
)
md5sums=('945eeacfcf2465f8800c62930ad33524'
         'da3e2a96ce96c4a25d2759c7442b91d5'
         '69fc01b855f37a98028267d4734a2c63'
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
