# Maintainer: Josh Hoffer <hoffer.joshua@gmail.com
# Contributor: Jack Rosenthal
pkgname=threelayout
pkgver=1.0
pkgrel=2
pkgdesc="Keyboard layout designed by Jack Rosenthal"
arch=(any)
url="https://github.com/jackrosenthal/threelayout"
license=('GPL')
install=threelayout.install
depends=()
makedepends=('ckbcomp' 'coreutils')
source=('https://raw.githubusercontent.com/jackrosenthal/threelayout/master/linux/xkb/symbols/3l')
sha256sums=('e56a4cda872d7c20c4ad6e544217f19095c9dfaf519b8abbba5fdf27957b0c76')

package() {
  mkdir -p $pkgdir/usr/share/X11/xkb/symbols
  mkdir -p $pkgdir/usr/share/kbd/keymaps/i386/$pkgname
  ckbcomp 3l | gzip -f - > $pkgname.map.gz
  install -Dm644 $srcdir/3l $pkgdir/usr/share/X11/xkb/symbols/3l
  install -Dm644 $srcdir/$pkgname.map.gz $pkgdir/usr/share/kbd/keymaps/i386/3l/3l.map.gz
}

