# Maintainer: Josh Mandle <difarem@gmail.com>
pkgname=famitracker
_pkgname='FamiTracker'
pkgver=0.4.6
pkgrel=2
pkgdesc='Free tracker for producing music for the NES/Famicom-systems.'
url='http://www.famitracker.com'
arch=(any)
depends=(wine)
makedepends=(unzip)
source=(http://www.famitracker.com/files/FamiTracker-v$pkgver.zip
        famitracker
        famitracker.desktop
        famitracker.png)
md5sums=('344e4b3cc20628237c50adffdc216cd9'
         '6230d525ce2919ddd875904f70721179'
         '80e0f0f0b6f21fa7932013c0b23c08bc'
         '7a31ce754a85075758323db042deed51')
license=('GPL')

package() {
  cd $srcdir
  install -Dm755 famitracker $pkgdir/usr/bin/famitracker
  install -Dm644 famitracker.desktop $pkgdir/usr/share/applications/famitracker.desktop
  install -Dm644 famitracker.png $pkgdir/usr/share/pixmaps/famitracker.png
  
  unzip -qu FamiTracker-v$pkgver.zip -d $pkgdir/usr/share/famitracker
  find $pkgdir/usr/share/famitracker -type d -exec chmod 755 "{}" \;
  find $pkgdir/usr/share/famitracker -type f -exec chmod 644 "{}" \;
}
