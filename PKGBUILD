# The original Combat game for the old Atari 2600 game console

# Contributor: David Rosenstrauch <darose@darose.net>
pkgname=atari-combat
pkgver=1.0
pkgrel=2
pkgdesc="The original Combat game for the old Atari 2600 game console"
arch=('any')
url="http://www.atariage.com/software_page.html?SoftwareLabelID=96"
license=('unknown')
depends=(stella)
source=('http://www.atariage.com/2600/roms/Combat.zip')
md5sums=('16f792a416cf2903f925a639561271ed')

package() {
  cd "$srcdir"

  install -d $pkgdir/usr/share/$pkgname/
  _rom_img_file=Combat.bin
  install -m644 $_rom_img_file $pkgdir/usr/share/$pkgname/
  echo "#!/bin/sh" > $pkgname
  echo stella /usr/share/$pkgname/$_rom_img_file >> $pkgname
  install -D -m755 $pkgname $pkgdir/usr/bin/$pkgname
}
