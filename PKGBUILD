# The original Breakout game for the old Atari 2600 game console

# Contributor: David Rosenstrauch <darose@darose.net>
pkgname=atari-breakout
pkgver=1.0
pkgrel=2
pkgdesc="The original Breakout game for the old Atari 2600 game console"
arch=('any')
url="http://www.atariage.com/software_page.html?SoftwareLabelID=52"
license=('unknown')
depends=(stella)
source=('http://www.atariage.com/2600/roms/Breakout.zip')
md5sums=('9c90533b643db8b62aebba7958a25944')

package() {
  cd "$srcdir"

  install -d $pkgdir/usr/share/$pkgname/
  _rom_img_file=Breakout.bin
  install -m644 $_rom_img_file $pkgdir/usr/share/$pkgname/
  echo "#!/bin/sh" > $pkgname
  echo stella /usr/share/$pkgname/$_rom_img_file >> $pkgname
  install -D -m755 $pkgname $pkgdir/usr/bin/$pkgname
}
