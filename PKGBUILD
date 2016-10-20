# Maintainer: Filip <fila pruda com>
pkgname=mp3directcut
pkgver=2.22
_downver=222
pkgrel=1
pkgdesc="fast audio editor and recorder for mp3 with no need to decompress"
arch=('i686' 'x86_64')
url="http://mpesch3.de1.cc/mp3dc.html"
license=('FREEWARE')
[ "$CARCH" = "i686" ] && depends=(wine mpg123)
[ "$CARCH" = "x86_64" ] && depends=(wine lib32-mpg123)
makedepends=()
source=(mp3directcut mp3directcut.desktop mp3dcicon.png http://free-pc.ru/download/mp3DC$_downver.exe)
#http://ftp.elf.stuba.sk/pub/pc/sound/mp3dc$_downver.exe
md5sums=(
	'31de44159649baddf5c7b6936b87133f' '910ada5caa9b0ea67a88bfc7ffe9c237'
	'81a5bbd5789094b4bf5822791826c162' '8173f18fcac6e1a58f3b372e24fdcad9')

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