# The original Adventure game for the old Atari 2600 game console

# Contributor: David Rosenstrauch <darose@darose.net>
pkgname=atari-adventure
pkgver=1.0
pkgrel=3
pkgdesc="The original Adventure game for the old Atari 2600 game console"
arch=('any')
url="http://www.atariage.com/software_page.html?SoftwareID=802"
license=('unknown')
depends=(stella)
source=('http://www.atariage.com/2600/roms/Adventure.zip' 'http://www.warrenrobinett.com/adventure/adv-map1.gif')
md5sums=('22683ccd7b7c0fb7935d1b6c30e03395' '824dc77ccf37b3ff62c72bfa41a55a9a')

package() {
  cd "$srcdir"

  install -d $pkgdir/usr/share/$pkgname/
  install -m644 adv-map1.gif $pkgdir/usr/share/$pkgname/
  _rom_img_file=ADVNTURE.BIN 
  install -m644 $_rom_img_file $pkgdir/usr/share/$pkgname/
  echo "#!/bin/sh" > $pkgname
  echo stella /usr/share/$pkgname/$_rom_img_file >> $pkgname
  install -D -m755 $pkgname $pkgdir/usr/bin/$pkgname
}
