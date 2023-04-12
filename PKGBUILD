# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Filip <fila pruda com>

pkgname=mp3directcut
pkgver=2.36
pkgrel=2
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
sha256sums=('406018fc3e4b3aa13b963706c62ab0a65889ad8d1cfa15c9ceb46d4c27c36f71'
            'd0aa5b02aa6e99a926238747e4a16aae9a7aab6e25612fed0ee46b4cd949c34d'
            '99249e0b1e64c670aac164be5cf0fda5ba16878ce58ae7180d284abfa6d9df33'
            '178d703eb9958990d6b53b0da34e91b21bfed20316ad61a25b94c93f2e09739c')


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
