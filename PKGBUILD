# Maintainer: Sterophonick

pkgname=dcexel
_pkgname='dcexel'
pkgver=20231015
pkgrel=1
pkgdesc='Exelvision EXL100 family emulator for Windows'
url='dcexel.free.fr'
arch=(x86_64 i686)
depends=('wine')
makedepends=(p7zip)
source=(http://dcexel.free.fr/telechargement/prog/dcexel_20231015.zip
        dcexel
        dcexel.desktop
        dcexel.png)
noextract=(dcexel_20231015.zip)
md5sums=('3b36ec9be175213ccaf41851432d82f5'
         'SKIP'
         'SKIP'
         'SKIP')

prepare() {
  mkdir -p $srcdir/dcexel_20231015
  7z x dcexel_20231015.zip -o$srcdir/dcexel_20231015
}

package() {
  cd $srcdir
  install -Dm755 dcexel $pkgdir/usr/bin/dcexel
  install -Dm644 dcexel.desktop $pkgdir/usr/share/applications/dcexel.desktop
  install -Dm644 dcexel.png $pkgdir/usr/share/pixmaps/dcexel.png

  mkdir -p $pkgdir/usr/share/dcexel/
  cp dcexel_20231015/* $pkgdir/usr/share/dcexel
  chmod -R 777 $pkgdir/usr/share/dcexel
}
