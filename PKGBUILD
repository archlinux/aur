# Maintainer: Sterophonick
pkgname=lateralgm-bin
_pkgname='lateralgm-bin'
pkgver=1.8.234
pkgrel=2
pkgdesc='Open-source Game Maker source file editor'
url='http://lateralgm.org/'
arch=(any)
depends=('java-runtime') # specifically needs a java that's not 22 so i tried this one. bruh.
source=(https://github.com/IsmAvatar/LateralGM/releases/download/v1.8.234/lateralgm.jar
        lateralgm
        lateralgm.desktop
        lateralgm.png)
md5sums=('adc80748604b8f10d05f7ff14a3b7707'
         'SKIP'
         'SKIP'
         'SKIP')
provides=('lateralgm')
options=(!strip)

package() {
  cd $srcdir
  install -Dm755 lateralgm $pkgdir/usr/bin/lateralgm
  install -Dm644 lateralgm.desktop $pkgdir/usr/share/applications/lateralgm.desktop
  install -Dm644 lateralgm.png $pkgdir/usr/share/pixmaps/lateralgm.png

  mkdir -p $pkgdir/usr/share/lateralgm

  cp -r lateralgm.jar $pkgdir/usr/share/lateralgm
  chmod -R 777 $pkgdir/usr/share/lateralgm
}
