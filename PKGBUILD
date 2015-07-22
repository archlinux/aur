# The original Bowling game for the old Atari 2600 game console

# Contributor: David Rosenstrauch <darose@darose.net>
pkgname=atari-bowling
pkgver=1.0
pkgrel=2
pkgdesc="The original Bowling game for the old Atari 2600 game console"
arch=('any')
url="http://www.atariage.com/software_page.html?SoftwareLabelID=42"
license=('unknown')
depends=(stella)
source=('http://www.atariage.com/2600/roms/Bowling.zip')
md5sums=('49a4aa4ff0d37c5622abece8ae25e716')

package() {
  cd "$srcdir"

  install -d $pkgdir/usr/share/$pkgname/
  _rom_img_file=Bowling.bin
  install -m644 $_rom_img_file $pkgdir/usr/share/$pkgname/
  echo "#!/bin/sh" > $pkgname
  echo stella /usr/share/$pkgname/$_rom_img_file >> $pkgname
  install -D -m755 $pkgname $pkgdir/usr/bin/$pkgname
}
