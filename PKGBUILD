# Maintainer: Sterophonick

pkgname=foon
_pkgname='foon'
pkgver=0.22
pkgrel=1
pkgdesc='Spectrum Emulator for the Game Boy Advance'
url='http://foon.pocketheaven.com'
arch=(x86_64 i686)
depends=('wine' 'winetricks')
source=(http://web.archive.org/web/20050205181902/http://foon.pocketheaven.com/downloads/foon022.zip
        foon
        foon.desktop
        foon.png)
md5sums=('1a975a8729e0485ac0cae90d39e64560'
         'SKIP'
         'SKIP'
         'SKIP')


package() {
  cd $srcdir
  install -Dm755 foon $pkgdir/usr/bin/foon
  install -Dm644 foon.desktop $pkgdir/usr/share/applications/foon.desktop
  install -Dm644 foon.png $pkgdir/usr/share/pixmaps/foon.png
  
  mkdir -p $pkgdir/usr/share/foon

  install -Dm644 INJECT.EXE $pkgdir/usr/share/foon
  chmod -R 777 $pkgdir/usr/share/foon
}
