# The original Space Invaders game for the old Atari 2600 game console

# Contributor: David Rosenstrauch <darose@darose.net>
pkgname=atari-space-invaders
pkgver=1.0
pkgrel=2
pkgdesc="The original Space Invaders game for the old Atari 2600 game console"
arch=('any')
url="http://www.atariage.com/software_page.html?SoftwareLabelID=459"
license=('unknown')
depends=(stella)
source=('http://www.atariage.com/2600/roms/SpaceInvaders.zip')
md5sums=('05200719312f1d2eee36a33e9d5cbe97')

package() {
  cd "$srcdir"

  install -d $pkgdir/usr/share/$pkgname/
  _rom_img_file=SPCINVAD.BIN
  install -m644 $_rom_img_file $pkgdir/usr/share/$pkgname/
  echo "#!/bin/sh" > $pkgname
  echo stella /usr/share/$pkgname/$_rom_img_file >> $pkgname
  install -D -m755 $pkgname $pkgdir/usr/bin/$pkgname
}
