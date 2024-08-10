# Maintainer: Sterophonick
pkgname=vortex-tracker-ii
_pkgname='vortex-tracker-ii'
pkgver=1.0
pkgrel=1
pkgdesc='PT3 music editor for Windows'
url='https://bulba.untergrund.net/vortex_e.htm'
arch=(x86_64 i686)
depends=('wine' 'winetricks')
makedepends=('p7zip')
filename=VT1.0-32
source=(https://bulba.untergrund.net/VT1.0-32.7z
        vortex-tracker-ii
        vortex-tracker-ii.desktop
        vortex-tracker-ii.png
        )
md5sums=('d582da62b836928c17127bca26910322'
         'SKIP'
         'SKIP'
         'SKIP')
options=(!strip)

prepare() {
  cd $srcdir
  mkdir -p vt
  7z x VT1.0-32.7z -aou -ovt
}

package() {
  cd $srcdir
  install -Dm755 vortex-tracker-ii $pkgdir/usr/bin/vortex-tracker-ii
  install -Dm644 vortex-tracker-ii.desktop $pkgdir/usr/share/applications/vortex-tracker-ii.desktop
  install -Dm644 vortex-tracker-ii.png $pkgdir/usr/share/pixmaps/vortex-tracker-ii.png

  mkdir -p $pkgdir/usr/share/vortex-tracker-ii

  cp -r $srcdir/vt/* $pkgdir/usr/share/vortex-tracker-ii

  chmod -R 777 $pkgdir/usr/share/vortex-tracker-ii
}
