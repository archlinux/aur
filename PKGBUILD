# Maintainer: Kacper Łukawski <kacluk98@gmail.com>
pkgname=logicdraw
pkgver=0.1.13
pkgrel=1
pkgdesc="An application to perform simulations of logic gates, in which you can paint your circuit like in raster graphics editor."
arch=('any')
url="https://github.com/Wieku/LogicDraw"
license=('MIT')
depends=('java-runtime' 'libgl')
source=("https://ci.wieku.me/job/LogicDraw/$(echo $pkgver|cut -d"." -f3)/artifact/desktop/build/libs/LogicDraw-$pkgver.jar"
  "logicdraw"
  "logicdraw.desktop" )
noextract=()
md5sums=('dbaac2868e967a6c960302424bc066b9'
         'dbc0616e552aca3bcc4781fefdceea04'
         'a4c84914036108b15892e2c60a36066f')
validpgpkeys=()
conflicts=('logicdraw')
provides=('logicdraw')

package() {
  cd "$srcdir"

  install -d "$pkgdir"/usr/{bin,share/logicdraw}
  install "$srcdir"/logicdraw "$pkgdir"/usr/bin/
  install -D -m644 "$srcdir"/logicdraw.desktop "$pkgdir"/usr/share/applications/logicdraw.desktop
  mv -f LogicDraw-$pkgver.jar "$pkgdir"/usr/share/logicdraw/logicdraw.jar
}
