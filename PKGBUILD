# Maintainer: Filip <fila pruda.com>
pkgname=mp3directcut
pkgver=2.20
_downver=220
pkgrel=1
pkgdesc="fast audio editor and recorder for mp3 with no need to decompress"
arch=('i686' 'x86_64')
url="http://mpesch3.de1.cc/mp3dc.html"
license=('FREEWARE')
[ "$CARCH" = "i686" ] && depends=(wine mpg123)
[ "$CARCH" = "x86_64" ] && depends=(wine lib32-mpg123)
makedepends=()
source=(mp3directcut mp3directcut.desktop mp3dcicon.png http://mp.mpex.net/files/mp3DC$_downver.exe)
md5sums=(
	'31de44159649baddf5c7b6936b87133f' '910ada5caa9b0ea67a88bfc7ffe9c237'
	'a56a1f306e2c918f0e5f8b5cabdf8c1d' '7159533de29017dca87f100f31d625bd')

package() {

  #bin
  install -Dm755 "mp3directcut" "$pkgdir/usr/bin/mp3directcut"
  
  #app
  install -d -m755 "$pkgdir/usr/share/mp3directcut"
  install -m644 "mp3DirectCut.exe" "$pkgdir/usr/share/mp3directcut"
  
  install -d -m755 "$pkgdir/usr/share/mp3directcut/Languages"
  cp -r "Languages/." "$pkgdir/usr/share/mp3directcut/Languages"
  
  #.desktop icon
  install -Dm644 "mp3directcut.desktop" "$pkgdir/usr/share/applications/mp3directcut.desktop"
  install -Dm644 "mp3dcicon.png" "$pkgdir/usr/share/pixmaps/mp3directcut.png"
  
  #docs
  install -d -m755 "$pkgdir/usr/share/doc/mp3directcut"
  install -m644 *.txt *.htm "$pkgdir/usr/share/doc/mp3directcut"
  
} 