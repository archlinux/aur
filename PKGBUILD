# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Filip <fila pruda com>

pkgname=mp3directcut
pkgver=2.31
pkgrel=1
pkgdesc="fast audio editor and recorder for mp3 with no need to decompress"
arch=('i686' 'x86_64')
url="https://mpesch3.de/index.html"
license=('FREEWARE')
depends=(wine)
depends_i686=(mpg123)
depends_x86_64=(lib32-mpg123)
optdepends_i686=('libpulse: PulseAudio plugin')
optdepends_x86_64=('lib32-libpulse: PulseAudio plugin')
source=(http://ftp.elf.stuba.sk/pub/pc/sound/mp3dc${pkgver/.}.exe
        mp3directcut
        mp3directcut.desktop
        mp3dcicon.png)
md5sums=('7c0d108b395a466a004aafb8c30f8cac'
         '31de44159649baddf5c7b6936b87133f'
         '910ada5caa9b0ea67a88bfc7ffe9c237'
         '81a5bbd5789094b4bf5822791826c162')


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
