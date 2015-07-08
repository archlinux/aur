# Maintainer: OS Hazard <oshazard+aur@gmail.com>
pkgname=surgeonsimulator2013
pkgver=1.2
pkgrel=7
pkgdesc="Poor Bob fell off his toilet, resulting in urgent need for a heart transplant."
url="http://gamejam.bossastudios.com/"
license="custom"
makedepends=('unzip')
depends_i686=('libgl' 'glu' 'libxcursor')
depends_x86_64=('lib32-libgl' 'lib32-glu' 'lib32-libxcursor')
arch=('i686' 'x86_64')
source=('http://downloads.bossastudios.com/ss2013/surgeonsimulator2013_linux.zip' 
	'https://github.com/oshazard/aur-includes/raw/master/surgeonsimulator2013/includes.tar.gz')
options=(!strip)
install=$pkgname.install
md5sums=('05dcef7582f5c05bc1c7afe250f1b227'
	'0a22cb563626fb981aba041b7ef44b5f')

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/share/$pkgname
  cp -r $srcdir/SurgeonSimulator2013_Data $pkgdir/usr/share/$pkgname/

  mkdir -p $pkgdir/usr/bin
  cp SurgeonSimulator2013 $pkgdir/usr/share/$pkgname/
  echo '#!/bin/sh' > $pkgdir/usr/bin/surgeonsimulator2013;
  echo "/usr/share/$pkgname/SurgeonSimulator2013" >> $pkgdir/usr/bin/surgeonsimulator2013;
  chmod +x $pkgdir/usr/bin/surgeonsimulator2013

  cd $srcdir/surgeon-sim
  install -Dm644 ${pkgname}.png ${pkgdir}/usr/share/icons/hicolor/64x64/apps/${pkgname}.png
  install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
