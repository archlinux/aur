# Maintainer: zoe <chp321 at gmail dot com>

pkgname=tsmuxer
pkgver=2.6.11
pkgrel=8
pkgdesc="Remux/mux elementary streams, EVO/VOB/MPG, MKV/MKA, MP4/MOV, TS, M2TS to TS to M2TS, without re-encoding. Can quickly generate your own Blu-ray discs by processing your media files and converting them into streamable content. CLI and GUI all-in-one"
url="http://www.videohelp.com/software/tsMuxeR"
arch=('i686' 'x86_64')
license=('custom')
depends=('bash' 'gcc-libs' 'freetype2' 'qt4' 'libpng12'
         'lib32-gcc-libs' 'lib32-freetype2' 'lib32-qt4' 'lib32-libpng12'
         )
conflicts=('tsmuxer-cli' 'tsmuxer-cli-ng' 'tsmuxer-gui' 'tsmuxer-gui-ng' 'tsmuxer-ng-cli-bin' 'tsmuxer-ng-gui-bin')
provides=('tsmuxer-cli' 'tsmuxer-cli-ng' 'tsmuxer-gui' 'tsmuxer-gui-ng' 'tsmuxer-ng-cli-bin' 'tsmuxer-ng-gui-bin')
source=("https://www.deb-multimedia.org/pool/non-free/t/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz"
         "${pkgname}.desktop" "${pkgname}.png" "LICENSE")
md5sums=('21e86f83d76917a4160d9ae93b9ac765'
         '6ce782be4b5f7ca0203ba4fb14d1c328'
         '3e71328058f9dbeb5c580a5fb7c6850a'
         'c042a4c5e9dd8393f62ee0e63affc485')

package() {
  cd $srcdir/${pkgname}-${pkgver}  
  install -D -m755 -t $pkgdir/usr/bin/  ./tsMuxeR   ./tsMuxerGUI
  install -D -m644 $srcdir/${pkgname}.png     $pkgdir/usr/share/icons/hicolor/32x32/apps/${pkgname}.png
  install -D -m644 $srcdir/${pkgname}.desktop $pkgdir/usr/share/applications/${pkgname}.desktop
  install -D -m644 $srcdir/LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}
