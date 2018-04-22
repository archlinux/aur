# Maintainer: Difarem <difarem@gmail.com>
pkgname=0cc-famitracker
_pkgname='0CC-FamiTracker'
pkgver=0.3.15.1
pkgrel=1
pkgdesc='Backward-compatible extension of FamiTracker that includes various bug fixes and new features.'
url='http://hertzdevil.info/programs/'
arch=(any)
depends=(wine)
makedepends=(p7zip)
filename=0CCft_v0315r1
source=(http://hertzdevil.info/programs/$filename.7z
        0cc-famitracker
        0cc-famitracker.desktop
        0cc-famitracker.png)
md5sums=('439ea5890c1f1230ad5b07498449e41c'
         '3bc7f74aaf38ca5fa62ab08e524d3c3f'
         'a335ee1099cc35ae830954f548daf6fe'
         'f68aef841cc2692f1d6b47dae40da447')
license=('GPL')

package() {
  cd $srcdir
  install -Dm755 0cc-famitracker $pkgdir/usr/bin/0cc-famitracker
  install -Dm644 0cc-famitracker.desktop $pkgdir/usr/share/applications/0cc-famitracker.desktop
  install -Dm644 0cc-famitracker.png $pkgdir/usr/share/pixmaps/0cc-famitracker.png
  
  install -Dm644 $filename/0CC-readme.txt $pkgdir/usr/share/doc/0cc-famitracker/readme.txt
  install -Dm644 $filename/specs.txt $pkgdir/usr/share/doc/0cc-famitracker/specs.txt
  install -Dm644 $filename/changelog.txt $pkgdir/usr/share/doc/0cc-famitracker/changelog.txt
  
  cp -rT $filename $pkgdir/usr/share/0cc-famitracker
  find $pkgdir/usr/share/0cc-famitracker -type d -exec chmod 755 "{}" \;
  find $pkgdir/usr/share/0cc-famitracker -type f -exec chmod 644 "{}" \;
}
