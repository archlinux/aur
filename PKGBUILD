# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=shadow-icon-theme-git
_pkgname=Shadow
pkgver=2.2.1.r7.g71fdcb0
pkgrel=1
arch=('any')
pkgdesc="A flat colourful icon theme for GNOME 3.10+"
url="http://gnome-look.org/content/show.php/Shadow?content=170398"
makedepends=('git')
source=("git+https://github.com/rudrab/Shadow.git")
license=('GPL')
sha256sums=('SKIP')

pkgver () {
  cd $srcdir/$_pkgname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//g'
}

package() {
  mkdir -p $pkgdir/usr/share/icons/
  cp -a "$srcdir/Shadow" "$pkgdir/usr/share/icons/Shadow"
  rm -rf "$pkgdir/usr/share/icons/Shadow/.git"
}
