# Maintainer: Jeff Youdontneedtoknow <jeffpublicjr at gmail dot com>
pkgname=heli-x6
pkgver=6.0.1614
pkgrel=1
pkgdesc="Latest Professional R/C helicopter flight simulator from Heli x"
arch=("i686" "x86_64")
url="http://www.heli-x.net/"
license=('custom')
depends=('java-environment-common' 'lib32-libxcursor' 'lib32-libxrandr' 'bash' 'lib32-libxxf86vm')
makedepends=('imagemagick')
source=('heli-x6' 'heli-x6.desktop' 'http://www.heli-x.info/1614/HELI-X6.tar.gz')
md5sums=('b6bc5595d0dd2b3715b5a78f3b58feda'
         '1a42b994dee957dfd17e5db2f4cec098'
         '9e0f57f74ce37f9a80013c0fb5de82bc')

options=(!strip)

package() {
  install -d -m755 $pkgdir/usr/share/
  cp -R HELI-X6 $pkgdir/usr/share/$pkgname
  install -d -m755 $pkgdir/usr/bin
  install -m755 heli-x6 $pkgdir/usr/bin/$pkgname
  install -d -m755 $pkgdir/usr/share/applications
  install -d -m755 $pkgdir/usr/share/pixmaps
  install -m755 $pkgname.desktop $pkgdir/usr/share/applications
  convert $srcdir/HELI-X6/runHeli-X.ico runHELI-X-3.png
  install -m755 $srcdir/runHELI-X-3-3.png $pkgdir/usr/share/pixmaps/$pkgname.png
  install -d -m755 $pkgdir/usr/share/licenses/$pkgname
  install -m755 $srcdir/HELI-X6/libs/HeliX/license.txt $pkgdir/usr/share/licenses/$pkgname/license.text
  install -m755 $srcdir/HELI-X6/libs/HeliX/license_e.txt $pkgdir/usr/share/licenses/$pkgname/license_e.text
  }

 
